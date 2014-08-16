function [T] = main(t, N, NP, E, NE, Ta, Tk, h, Kxx, r, pc, dt, isk, dinv, R, alg)
%Pagrindine funkcija
%   Pagrindine BEM funkcija

addpath('Algoritmai');

tt = tic;

%Paruosiamoji dalis
r1 =  R(1:end-1);      r2 = R(2:end);
N1  = N(2:end,1);      N2  = N(2:end,2);      N3  = N(2:end,3);
N12 = N(1:end-1,1);    N22 = N(1:end-1,2);    N32 = N(1:end-1,3);

%Formuojama K matrica
%---------------------------------

if t==0
	switch alg
		case 'parfor'
			[F, K] = FK_parfor(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, 1);
		case 'spmd'
			[F, K] = FK_spmd(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, 1);
		case 'gpu'
			[F, K] = FK_gpu(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, 1);
		case 'nuoseklus'
			[F, K] = FK_nuoseklus(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, 1);
		case 'nuoseklusgpu'
			[F, K] = FK_nuoseklusgpu(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, 1);		
	end;
else
	switch alg
		case 'parfor'
			[F, K, C] = FKC_parfor(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, 1);
		case 'spmd'
			[F, K, C] = FKC_spmd(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, 1);
		case 'gpu'
			[F, K, C] = FKC_gpu(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, 1);
		case 'nuoseklus'
			[F, K, C] = FKC_nuoseklus(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, 1);
		case 'nuoseklusgpu'
			[F, K, C] = FKC_nuoseklusgpu(NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, 1);	
	end;    
end;

%---------------------------------

%Deklaruojamas temperaturu T vektorius
T = zeros(NP, 1, isk);

%Pagal laika; param. t
%---------------------------------
%Dinaminis
if t==1 || t==2
    
    %---------------------------------
    
    %Franko-Nikolsono
        %Apskaiciuojama matrica P
        P = 2 / dt * C;
        %Apskaiciuojama matrica A
        A = P + K;
    
    %Apskaiciuojamas temperaturu vektorius T      
    T(:, 1, 1) = Ta; 
    T(1, 1, 1) = Tk;  
    
    for i = 2 : isk  
        %Franko-Nikolsono
        Ta = Ta - 1;
		switch alg
			case 'parfor'
				Fn = F_parfor(NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, 1);
			case 'spmd'
				Fn = F_somd(NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, 1);
			case 'gpu'
				Fn = F_gpu(NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, 1);
			case 'nuoseklus'
				Fn = F_nuoseklus(NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, 1);
			case 'nuoseklusgpu'
				Fn = F_nuoseklusgpu(NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, 1);		
		end;
        F = (F + Fn) / 2;
        tmp = (P - K) * T(:, 1, i-1) + 2*F;
        %Modifikuoja vektorius pagal pradine temperatura       
        [tmp, A2] = Adapt(tmp, A, Tk, 1);    
        T(:, 1, i) = A2 \ tmp;            
    end;
    
%Statinis    
else  
    [F, K] = Adapt(F, K, Tk, 1);      
    T = K \ F; 
end;
toc(tt);
disp('-');
%---------------------------------

%Sprendinio vaizdavimas. Nestacionaraus proceso vizualizavimas sioje funkcijoje neigalintas
%---------------------------------
if t == 0     
    Grafikas(NP, T');
 end;
%---------------------------------

end
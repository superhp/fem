function [F, K] = FK_spmd( NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F, K
%   {F} ir [K] sudarymo procedura stacionariam procesui naudojant spmd

spmd;
    
n = floor(NE/numlabs);

a = 1 + (labindex-1)*n;
c = (labindex-1)*n;

if labindex == numlabs
    n = n + NE - n*numlabs;
end;

b = a + n-1;
    
tt = ones(n, 1);
pp = zeros(n,1);
F = zeros(n, 1);
ff = zeros(n, 1);

for i = a : b   
   Nilg = sqrt((N1(i) - N12(i))^2 + ...
               (N2(i) - N22(i))^2 + ...
               (N3(i) - N32(i))^2);
           
   P1 = 2*r1(i);   P2 = 2*r2(i);
   S1 = r1(i)*r1(i);   S2 = r2(i)*r2(i);
   
   tmpK = (S1 + S2)/2 * Kxx / Nilg * [1, -1; -1, 1] + ...
       h * Nilg / 12 * [3*P1+P2, P1+P2; P1+P2, P1+3*P2];  
   tmpF = h * Ta * Nilg / 6 * [2 1; 1 2] * [P1; P2];
   
   % silumos atidavimas per gala
   if i == NE && i ~= kuris    
       tmpK = tmpK + h * S2 * [0, 0; 0, 1];
       tmpF = tmpF + h * S2 * Ta * [0; 1]; 
   elseif i == 1 && i ~= kuris  
       tmpK = tmpK + h * S1 * [1, 0; 0, 0];
       tmpF = tmpF + h * S1 * Ta * [1; 0];
   end;
     
   tt((i-1-c)*3+1:(i-1-c)*3+3) = [tmpK(3); tmpK(2); tmpK(4)];
   pp(i-c) = tmpK(1);   
   F(i-c) = tmpF(2);
   ff(i-c) = tmpF(1);
end;

end;

F = [0; cell2mat(F(:))];
ff = cell2mat(ff(:));
tt = [0; cell2mat(tt(:))];
pp = cell2mat(pp(:));

tt(1:3:3*NE) = tt(1:3:3*NE) + pp;
F(1:NE) = F(1:NE) + ff;

ii = ones(NP*3-2,1);
jj = ones(NP*3-2,1);   
for i=2:NE
    for j=1:3
        ii(j+3*(i-1)-1) = i;
        jj(j+3*i-4) = i-2+j;
    end;
end;
ii(end-1:end) = NP;
jj(2) = 2;
jj(end-1:end) = NP-1:NP;

K = sparse(ii,jj,tt);

end
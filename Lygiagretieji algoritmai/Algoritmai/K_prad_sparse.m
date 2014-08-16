function K = K_prad_sparse( NP, NE, r, Kxx, N, h, kuris )
%Sudaroma matrica K
%   Neefektyvus algoritmas matricos [K] sudarymui (pereinamoji versija is po kursinio darbo)

%Deklaruojam matrica
K = spalloc(NP,NP,3*NP);

%Formuojam atskiras KK matricas elementams. i - eilute, j - stulpelis
KK = zeros(2, 2, NE);
for i = 1 : NE   
   Nilg = sqrt((N(i+1, 1) - N(i, 1))^2 + ...
               (N(i+1, 2) - N(i, 2))^2 + ...
               (N(i+1, 3) - N(i, 3))^2);
           
   P1 = 2*r(i);      P2 = 2*r(i+1);
   S1 = r(i)*r(i);   S2 = r(i+1)*r(i+1);
   
   KK(:,:, i) = (S1 + S2)/2 * Kxx / Nilg * [1, -1; -1, 1] + ...
       h * Nilg / 12 * [3*P1+P2, P1+P2; P1+P2, P1+3*P2]; 
   
   % silumos atidavimas per gala
   if i == NE && i ~= kuris    
       KK(:,:, i) = KK(:,:, i) + h * S2 * [0, 0; 0, 1];
   elseif i == 1 && i ~= kuris  
       KK(:,:, i) = KK(:,:, i) + h * S1 * [1, 0; 0, 0];
   end;
end;

%Formuojama matrica
K(1, 1) = KK(1, 1, 1);
K(1, 2) = KK(1, 2, 1);
for i = 2 : NP - 1
    K(i, i-1) = KK(2, 1, i-1);
    K(i, i) = KK(2, 2, i-1) + KK(1, 1, i);
    K(i, i+1) = KK(1, 2, i);
end;
K(NP, NP-1) = KK(2, 1, NE);
K(NP, NP) = KK(2, 2, NE);

end
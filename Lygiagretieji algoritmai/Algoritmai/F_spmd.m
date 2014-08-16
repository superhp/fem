function [F] = F_spmd( NP, NE, r1,r2, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F
%   {F} sudarymo procedura nestacionariam procesui naudojant spmd

spmd;
    
n = floor(NE/numlabs);

a = 1 + (labindex-1)*n;
c = (labindex-1)*n;

if labindex == numlabs
    n = n + NE - n*numlabs;
end;

b = a + n-1;
    
F = zeros(n, 1);
ff = zeros(n, 1);

for i = a : b   
   Nilg = sqrt((N1(i) - N12(i))^2 + ...
               (N2(i) - N22(i))^2 + ...
               (N3(i) - N32(i))^2);
           
   P1 = 2*r1(i);   P2 = 2*r2(i);
         
   tmpF = h * Ta * Nilg / 6 * [2 1; 1 2] * [P1; P2];
   
   % silumos atidavimas per gala
   if i == NE && i ~= kuris    
       S2 = r2(i)*r2(i);
       tmpF = tmpF + h * S2 * Ta * [0; 1]; 
   elseif i == 1 && i ~= kuris  
       S1 = r1(i)*r1(i);
       tmpF = tmpF + h * S1 * Ta * [1; 0];
   end;
     
   F(i-c) = tmpF(2);
   ff(i-c) = tmpF(1);
end;

end;

F = [0; cell2mat(F(:))];
ff = cell2mat(ff(:));
F(1:NE) = F(1:NE) + ff;

end
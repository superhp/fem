function [F, K] = FK_nuoseklus( NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F, K
%   nuoseklioji {F} ir [K] sudarymo procedura stacionariam procesui

tt = ones(3,NE);
pp = zeros(NE,1);
F = zeros(NP, 1);
ff = zeros(NP-1, 1);

for i = 1 : NE   
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
     
   tt(:,i) = [tmpK(3); tmpK(2); tmpK(4)];
   pp(i) = tmpK(1);   
   F(i+1) = tmpF(2);
   ff(i) = tmpF(1);
end;

tt = reshape(tt, numel(tt), 1);
tt = [0; tt];
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
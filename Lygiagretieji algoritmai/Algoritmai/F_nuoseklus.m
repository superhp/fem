function F = F_nuoseklus( NP, NE, N1,N12,N2,N22,N3,N32, r1,r2, Ta, h, kuris )
%Formuojamas apkrovos vektorius
%   nuoseklioji {F} sudarymo procedura nestacionariam procesui

F = zeros(NP, 1);
ff = zeros(NP-1, 1);

%Formuojami elementu vektoriai
for i = 1 : NE
    Nilg = sqrt((N1(i) - N12(i))^2 + ...
               (N2(i) - N22(i))^2 + ...
               (N3(i) - N32(i))^2);
           
    P1 = 2*r1(i);   P2 = 2*r2(i);    
    
    tmp = h * Ta * Nilg / 6 * [2 1; 1 2] * [P1; P2];
           
    % silumos atidavimas per gala
    if i == NE && i ~= kuris 
	S2 = r2(i)*r2(i);
        tmp = tmp + h * S2 * Ta * [0; 1]; 
    elseif i == 1 && i ~= kuris
	S1 = r1(i)*r1(i);   
        tmp = tmp + h * S1 * Ta * [1; 0];
    end;  
    
    F(i+1) = tmp(2);
    ff(i) = tmp(1);
end;

F(1:NE) = F(1:NE) + ff;

end
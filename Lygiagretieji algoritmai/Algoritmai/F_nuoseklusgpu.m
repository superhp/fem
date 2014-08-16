function F = F_nuoseklusgpu( NP, NE, r1,r2, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F
%   nuoseklioji {F} sudarymo procedura nestacionariam procesui imituojant arrayfun, GPU algoritma

F = zeros(NE, 1);
ff = zeros(NE, 1);

for i = 1 : NE
    Nilg = sqrt((N12(i) - N1(i))^2 + (N22(i) - N2(i))^2 + (N32(i) - N3(i))^2);
    P1 = 2*r1(i);       P2 = 2*r2(i);          
    
    ff(i) = h * Ta * Nilg / 6 * (P1+2*P2); 
    
    if i == NE && i ~= kuris 
        S2 = r2(i)*r2(i);
        F(i) = F(i) + h * S2 * Ta * 1;
    elseif i == 1 && i ~= kuris
        S1 = r1(i)*r1(i);
        ff(i) = ff(i) + h * S1 * Ta * 1;
    end;    
end;

F = [0; F];
Ff = F(1:NE) + ff;
F = [Ff; F(NP)];

end
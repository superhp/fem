function [F, K, C] = FKC_parfor( NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, pc, kuris )
%Sudaroma F, K, C
%   nuoseklioji {F} ir [K], [C] sudarymo procedura nestacionariam procesui imituojant GPU ir arrayfun

pp  = zeros(NE, 1);
t1 = zeros(NE, 1);
t2 = zeros(NE, 1);
t3 = zeros(NE, 1);
ppc = zeros(NE, 1);
t1c = zeros(NE, 1);
t2c = zeros(NE, 1);
t3c = zeros(NE, 1);
F = zeros(NE, 1);
ff = zeros(NE, 1);

for i = 1 : NE
    Nilg = sqrt((N12(i) - N1(i))^2 + (N22(i) - N2(i))^2 + (N32(i) - N3(i))^2);
    P1 = 2*r1(i);       P2 = 2*r2(i);
    S1 = r1(i)*r1(i);      S2 = r2(i)*r2(i);
    
    Sn = (S1+S2)/2;    
    pp(i) =  Sn * Kxx / Nilg * 1    + h * Nilg / 12 * (3*P1+P2);
    t1(i) = Sn * Kxx / Nilg * (-1) + h * Nilg / 12 * (P1+P2);
    t2(i) = t1(i);
    t3(i) = Sn * Kxx / Nilg * 1    + h * Nilg / 12 * (P1+3*P2);  
    
    ppc(i) =  Sn * pc / Nilg / 6 * 2;
    t1c(i) = Sn * pc / Nilg / 6 * (1);
    t2c(i) = t1c(i);
    t3c(i) = ppc(i);  
    
    F(i) = h * Ta * Nilg / 6 * (2*P1+P2);
    ff(i) = h * Ta * Nilg / 6 * (P1+2*P2); 
    
    if i == NE && i ~= kuris 
        t3(i) = t3(i) + h * S2 * 1;
        F(i) = F(i) + h * S2 * Ta * 1;
    elseif i == 1 && i ~= kuris
        pp(i) = pp(i) + h * S1 * 1;
        ff(i) = ff(i) + h * S1 * Ta * 1;
    end;    
end;

ttc = reshape([t1c';t2c';t3c'],3*NE,1);
ttc = [0; ttc];
ttc(1:3:3*NE) = ttc(1:3:3*NE) + ppc;
tt = reshape([t1';t2';t3'],3*NE,1);
tt = [0; tt];
tt(1:3:3*NE) = tt(1:3:3*NE) + pp;
F = [0; F];
Ff = F(1:NE) + ff;
F = [Ff; F(NP)];

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

C = sparse(ii,jj,ttc);
K = sparse(ii,jj,tt);

end
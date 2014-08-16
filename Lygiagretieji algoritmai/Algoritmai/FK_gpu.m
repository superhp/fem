function [F, K] = FK_gpu( NP, NE, r1,r2, Kxx, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F, K
%   {F} ir [K] sudarymo procedura stacionariam procesui naudojant arrayfun, GPU

n = gpuArray((1:NE))';
rg1 = gpuArray(r1); rg2 = gpuArray(r2);
ng12 = gpuArray(N1); ng11 = gpuArray(N12); ng22 = gpuArray(N2); ng21 = gpuArray(N22); ng32 = gpuArray(N3); ng31 = gpuArray(N32);

[F,ff, t1,t2,t3, pp] = arrayfun(@ffb, kuris,Ta,rg1,rg2,Kxx,h,NE, n, ng12,ng11,ng22,ng21,ng32,ng31);

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

F = gather(F);
tt = gather(tt);   

K = sparse(ii,jj,tt);

function  [f,fp, k1,k2,k3,p] = ffb(kuris,Ta, r1, r2, Kxx,h,NE, i, N12,N11,N22,N21,N32,N31)
    Nilg = sqrt((N12 - N11)^2 + (N22 - N21)^2 + (N32 - N31)^2);
    P1 = 2*r1;       P2 = 2*r2;
    S1 = r1*r1;   S2 = r2*r2;
    
    Sn = (S1+S2)/2;    
    p =  Sn * Kxx / Nilg * 1    + h * Nilg / 12 * (3*P1+P2);
    k1 = Sn * Kxx / Nilg * (-1) + h * Nilg / 12 * (P1+P2);
    k2 = k1;
    k3 = Sn * Kxx / Nilg * 1    + h * Nilg / 12 * (P1+3*P2);   
    
    f = h * Ta * Nilg / 6 * (2*P1+P2);
    fp = h * Ta * Nilg / 6 * (P1+2*P2); 
    
    if i == NE && i ~= kuris 
        k3 = k3 + h * S2 * 1;
        f = f + h * S2 * Ta * 1;
    elseif i == 1 && i ~= kuris
        p = p + h * S1 * 1;
        fp = fp + h * S1 * Ta * 1;
    end;    
end

end
function [F] = F_gpu( NP, NE, r1,r2, N1,N12,N2,N22,N3,N32, Ta, h, kuris )
%Sudaroma F
%   {F} sudarymo procedura nestacionariam procesui naudojant arrayfun, GPU

n = gpuArray((1:NE))';
rg1 = gpuArray(r1); rg2 = gpuArray(r2);
ng12 = gpuArray(N1); ng11 = gpuArray(N12); ng22 = gpuArray(N2); ng21 = gpuArray(N22); ng32 = gpuArray(N3); ng31 = gpuArray(N32);

[F,ff] = arrayfun(@ffb, kuris,Ta,rg1,rg2,h,NE, n, ng12,ng11,ng22,ng21,ng32,ng31);

F = [0; F];
Ff = F(1:NE) + ff;
F = [Ff; F(NP)];

F = gather(F);

function  [f,fp] = ffb(kuris,Ta, r1, r2,h,NE, i, N12,N11,N22,N21,N32,N31)
    Nilg = sqrt((N12 - N11)^2 + (N22 - N21)^2 + (N32 - N31)^2);
    P1 = 2*r1;       P2 = 2*r2;       
    
    f = h * Ta * Nilg / 6 * (2*P1+P2);
    fp = h * Ta * Nilg / 6 * (P1+2*P2); 
    
    if i == NE && i ~= kuris 
        S2 = r2*r2;
        f = f + h * S2 * Ta * 1;
    elseif i == 1 && i ~= kuris
        S1 = r1*r1;
        fp = fp + h * S1 * Ta * 1;
    end;    
end

end
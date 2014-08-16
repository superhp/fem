function F = F_prad_sparse( NP, NE, N, r, Ta, h, kuris )
%Formuojamas apkrovos vektorius
%   %   Neefektyvus algoritmas vektoriaus {F} sudarymui (pereinamoji versija is po kursinio darbo)

%Deklaruojamas vektorius
F = zeros(NP, 1);

%Formuojami elementu vektoriai
FF = zeros(2, 1, NE);
for i = 1 : NE
    Nilg = sqrt((N(i+1, 1) - N(i, 1))^2 + ...
                (N(i+1, 2) - N(i, 2))^2 + ...
                (N(i+1, 3) - N(i, 3))^2);
           
    P1 = 2*r(i);   P2 = 2*r(i+1);
    
    FF(:, :, i) = h * Ta * Nilg / 6 * [2 1; 1 2] * [P1; P2];
    
    % silumos atidavimas per gala
    if i == NE && i ~= kuris 
        S2 = r(i+1)*r(i+1);
        FF(:, :, i) = FF(:, :, i) + h * S2 * Ta * [0; 1]; 
    elseif i == 1 && i ~= kuris
        S1 = r(i)*r(i);   
        FF(:, :, i) = FF(:, :, i) + h * S1 * Ta * [1; 0];
    end;  
end;

%Formuojamas vektorius F
F(1) = FF(1, 1, 1);
for i = 2 : NP - 1
    F(i) = FF(2, 1, i-1) + FF(1, 1, i);
end;
F(NP) = FF(2, 1, NP-1);

end


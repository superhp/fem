function F = Apkrovos1D( m1d, h )
%Formuojamas apkrovos vektorius
%   Detailed explanation goes here

%Deklaruojamas vektorius
F = zeros(m1d.NP, 1);
%Formuojami elementu vektoriai
FF = zeros(2, 1, m1d.NE);
for i = 1 : m1d.NE
    Nilg = m1d.NilgF(m1d.N, i);
    FF(:, :, i) = h * m1d.Ta * 2*m1d.r * Nilg / 2 * [1; 1];
    %Paskutinis, siluma atiduodantis elementas
    if (i == m1d.NE || i == 1) && i ~= m1d.kuris 
        FF(:, :, i) = FF(:, :, i) + h * m1d.r*m1d.r * m1d.Ta * [0; 1]; %ar tikrai 0 1?
    end;  
end;

%Formuojamas vektorius F
F(1) = FF(1, 1, 1);
for i = 2 : m1d.NP - 1
    F(i) = FF(2, 1, i-1) + FF(1, 1, i);
end;
F(m1d.NP) = FF(2, 1, m1d.NP-1);

end


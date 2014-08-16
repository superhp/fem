function K = MatricaK1D( m1d, Kxx, h )
%Sudaroma matrica K
%   Detailed explanation goes here

%Deklaruojam matrica
K = zeros(m1d.NP, m1d.NP);

%Formuojam atskiras KK matricas elementams. i - eilute, j - stulpelis
KK = zeros(2, 2, m1d.NE);
for i = 1 : m1d.NE   
   Nilg = m1d.NilgF(m1d.N, i);
   KK(:,:, i) = m1d.r*m1d.r * Kxx / Nilg * [1, -1; -1, 1] + ...
       h * 2*m1d.r * Nilg / 6 * [2, 1; 1, 2];
   %Paskutinis, siluma atiduodantis elementas
   if (i == m1d.NE || i == 1) && i ~= m1d.kuris    
       KK(:,:, i) = KK(:,:, i) + h * m1d.r*m1d.r * [0, 0; 0, 1];
   end;
end;

%Formuojama matrica
K(1, 1) = KK(1, 1, 1);
K(1, 2) = KK(1, 2, 1);
for i = 2 : m1d.NP - 1
    K(i, i-1) = KK(2, 1, i-1);
    K(i, i) = KK(2, 2, i-1) + KK(1, 1, i);
    K(i, i+1) = KK(1, 2, i);
end;
K(m1d.NP, m1d.NP-1) = KK(2, 1, m1d.NE);
K(m1d.NP, m1d.NP) = KK(2, 2, m1d.NE);

end


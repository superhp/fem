function C = MatricaC1D( m1d, pc )
%Sudaroma matrica C
%   Detailed explanation goes here

%Deklaruojam matrica
C = zeros(m1d.NP, m1d.NP);

%Formuojam atskiras CC matricas elementams. i - eilute, j - stulpelis
CC = zeros(2, 2, m1d.NE);
for i = 1 : m1d.NE
   Nilg = m1d.NilgF(m1d.N, i);
   CC(:,:, i) = pc * m1d.r*m1d.r * Nilg / 6 * [2, 1; 1, 2];  
end;

%Formuojama matrica
C(1, 1) = CC(1, 1, 1);
C(1, 2) = CC(1, 2, 1);
for i = 2 : m1d.NP - 1
    C(i, i-1) = CC(2, 1, i-1);
    C(i, i) = CC(2, 2, i-1) + CC(1, 1, i);
    C(i, i+1) = CC(1, 2, i);
end;
C(m1d.NP, m1d.NP-1) = CC(2, 1, m1d.NE);
C(m1d.NP, m1d.NP) = CC(2, 2, m1d.NE);

end


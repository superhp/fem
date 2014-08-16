function F = Apkrovos2D( m2d, N, E )
%Formuojamas apkrovos vektorius
%   Detailed explanation goes here

NP = m2d.NP;
NE = m2d.NE;

%Deklaruojamas vektorius
F = zeros(NP, 1);

%Formuojami elementu vektoriai
FF = zeros(3, 1, NE);
for i = 1 : NE
    [Lij Ljk Lik] = m2d.siena2D(E, N, i);     
        
    %h vektorius
    h = [ E(i,5) E(i,6) E(i,7) ];
    %Ta vektorius
    Ta = [ E(i,8) E(i,9) E(i,10) ];
   
    %h ir Ta gali buti skirtingi
    FF(:, :, i) = h(1) * Ta(1) * Lij * [1;1;0] / 2 + ...
                + h(2) * Ta(2) * Ljk * [0;1;1] / 2 + ...
                + h(3) * Ta(3) * Lik * [1;0;1] / 2;   
end;

%Formuojamas vektorius F
if NE > 1
    F(1:3) = FF(:, 1, 1);
    for i = 2 : NE
        F(i) = FF(1, 1, i) + FF(2, 1, i-1);
        F(i+1) = FF(2, 1, i) + FF(3, 1, i-1);
        F(i+2) = FF(3, 1, i);
    end;   
else
    F = FF;
end;

end
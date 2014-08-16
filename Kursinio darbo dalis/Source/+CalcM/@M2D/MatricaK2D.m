function K = MatricaK2D(m2d, N, E )
%Sudaroma matrica K
%   Detailed explanation goes here

NP = m2d.NP;
NE = m2d.NE;

%Deklaruojam matrica
K = zeros(NP, NP);

%Formuojam atskiras KK matricas elementams. i - eilute, j - stulpelis
KK = zeros(3, 3, NE);

for i = 1 : NE   
    
    %Kxx ir Kyy
    Kxy = [ E(i,11) E(i,12) ];
    %h vektorius
    h = [ E(i,5) E(i,6) E(i,7) ];
    
   %A apskaiciavimas     
   bi = N(E(i,2), 2)   - N(E(i,3), 2);
   bj = N(E(i,3), 2)   - N(E(i,1), 2);
   bk = N(E(i,1), 2)   - N(E(i,2), 2);
   ci = N(E(i,3), 1)   - N(E(i,2), 1);
   cj = N(E(i,1), 1)   - N(E(i,3), 1);
   ck = N(E(i,2), 1)   - N(E(i,1), 1);
   
   A = det([1 N(E(i,1),1) N(E(i,1),2); 1 N(E(i,2),1) N(E(i,2),2); 1 N(E(i,3),1) N(E(i,3),2)]) / 2;   
   
   K1 = [bi^2 bi*bj bi*bk; bi*bj bj^2 bj*bk; bi*bk bj*bk bk^2];
   K2 = [ci^2 ci*cj ci*ck; ci*cj cj^2 cj*ck; ci*ck cj*ck ck^2];
   
   KK(:,:, i) = Kxy(1) / (4*A) * K1 + Kxy(2) / (4*A) * K2;  
   
   %esant papildomoms salygoms h ir pan. PILDYTI!!!!   
   [Lij Ljk Lki] = m2d.siena2D(E, N, i);       
          
   KK(:,:, i) = KK(:,:, i) + h(2)*Ljk/6*[0 0 0; 0 2 1; 0 1 2] + ...
                           + h(3)*Lki/6*[2 0 1; 0 0 0; 1 0 2] + ...
                           + h(1)*Lij/6*[2 1 0; 1 2 0; 0 0 0];   %ar tikrai?            
  
end;

%Formuojama matrica
if NE > 1
    K(1, 1:3) = KK(1, :, 1); 
    K(2, 1:3) = KK(2, :, 1); 
    K(3, 1:3) = KK(3, :, 1);    
    for i = 2 : NE
        K(i,   i:i+2) = KK(1, :, i) + KK(2, :, i-1);   
        K(i+1, i:i+2) = KK(2, :, i) + KK(3, :, i-1);    
        K(i+2, i:i+2) = KK(3, :, i);  
    end;    
else
    K = KK;
end;

end
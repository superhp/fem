function [Lij Ljk Lki] = siena2D( E, N, i )
%DAUGIKLIS Summary of this function goes here
%   Detailed explanation goes here

   %{
   1 ij
   2 jk
   3 ik
   4 ij jk
   5 ij ik
   6 jk ik
   7 ij jk ik
   0 -
   %}   

daugiklis = zeros(3);
switch E(i, 4)
    case 1
        daugiklis(1) = 1;
    case 2
        daugiklis(2) = 1;
    case 3
        daugiklis(3) = 1;
    case 4
        daugiklis(1) = 1;   daugiklis(2) = 1;
    case 5
        daugiklis(1) = 1;   daugiklis(3)= 1;  
    case 6
        daugiklis(2) = 1;   daugiklis(3) = 1;
    case 7
        daugiklis(1) = 1;   daugiklis(2) = 1;    daugiklis(3) = 1;  
end;

Lij = sqrt((N(E(i,1), 1) - N(E(i,2), 1))^2 + ...
           (N(E(i,1), 2) - N(E(i,2), 2))^2)   * daugiklis(1);
Ljk = sqrt((N(E(i,2), 1) - N(E(i,3), 1))^2 + ...
           (N(E(i,2), 2) - N(E(i,3), 2))^2)   * daugiklis(2);
Lki = sqrt((N(E(i,1), 1) - N(E(i,3), 1))^2 + ...
           (N(E(i,1), 2) - N(E(i,3), 2))^2)   * daugiklis(3);  

end


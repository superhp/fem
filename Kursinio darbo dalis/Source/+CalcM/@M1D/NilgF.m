function Nilg = NilgF( N, i )
%NILG Summary of this function goes here
%   Detailed explanation goes here

Nilg = sqrt((N(i+1, 1) - N(i, 1))^2 + ...
            (N(i+1, 2) - N(i, 2))^2 + ...
            (N(i+1, 3) - N(i, 3))^2);

end


function [ F, K ] = Adapt( F, K, Tk, kuris )
%ADAPT Adaptacija
%   Detailed explanation goes here

%kuris - sildomo elemento nr.

%Keiciamas F
if kuris > 1
    F(kuris-1) = F(kuris-1) - K(kuris-1, kuris) * Tk;
end;
F(kuris) = Tk;
if kuris < length(F)
    F(kuris+1) = F(kuris+1) - K(kuris+1, kuris) * Tk;
end;

%Keiciama K
K(kuris, :) = 0;
K(kuris, kuris) = 1;
if kuris > 1
    K(kuris-1, kuris) = 0;
end;
if kuris < length(F)
    K(kuris+1, kuris) = 0;
end;

end


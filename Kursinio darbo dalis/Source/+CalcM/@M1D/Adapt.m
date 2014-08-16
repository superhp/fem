function [k f] = Adapt( m1d, Tk, k, f )
%ADAPT Adaptacija
%   Detailed explanation goes here

%kuris - sildomo elemento nr.

%Keiciamas F
if m1d.kuris > 1
    f(m1d.kuris-1) = f(m1d.kuris-1) - k(m1d.kuris-1, m1d.kuris) * Tk;
end;
f(m1d.kuris) = Tk;
if m1d.kuris < length(f)
    f(m1d.kuris+1) = f(m1d.kuris+1) - k(m1d.kuris+1, m1d.kuris) * Tk;
end;

%Keiciama K
k(m1d.kuris, :) = 0;
k(m1d.kuris, m1d.kuris) = 1;
if m1d.kuris > 1
    k(m1d.kuris-1, m1d.kuris) = 0;
end;
if m1d.kuris < length(f)
    k(m1d.kuris+1, m1d.kuris) = 0;
end;

end


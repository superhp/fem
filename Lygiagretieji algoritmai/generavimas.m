function [ ] = generavimas( n )
%GNRB Summary of this function goes here
%   Generuoja E,N,R matricas pagal nurodyta baigtiniu elementu skaiciu "n"; juos iraso kataloge "Duomenys"
%    E - elementu matrica, N - mazgu matrica, R - skerspjuviu vektorius


E = zeros(n, 2);
for i = 1 : n
    E(i, 1) = i;
    E(i, 2) = i + 1;
end;

%mazgu matrica
N = zeros(n+1, 3);
t = 1 / (n / 100);
parfor i = 1 : n / 100 * 40 +1
    N(i,:) = [i*t,150,0];
end;
t = sqrt(1800) / (n / 100 * 60);
for i = 1 : n / 100 * 60
    N(i+n / 100 * 40 + 1,:) = [1 / (n / 100)+40+i*t,150-i*t,0];
end;

R = ones(n+1,1)*3;
t = 10/(n/100*40);
parfor i = 1 : n / 100 * 40 
    R(i) = 13-(i-1)*t;
end;

save(char(strcat('Duomenys/',num2str(n),'/E')), 'E');
save(char(strcat('Duomenys/',num2str(n),'/N')), 'N');
save(char(strcat('Duomenys/',num2str(n),'/R')), 'R');

end


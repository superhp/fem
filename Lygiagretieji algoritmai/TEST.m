function TEST(mat, alg, t, isk)
%test funkcija
%   Funkcija algoritmu testavimui. TEST(<BE skaicius>, '<algoritmo pavadinimas>', <stacionarus = 0, stacionarus = 1>, <laiko iteraciju skaicius>)
%    testavimui paruosti algorimtai: 'nuoseklus', 'parfor', 'spmd', 'nuoseklusgpu', 'gpu'.
%     kitus algoritmus galima rasti kataloge "Algoritmai"

%!!! ISBANDYMUI
%PVZ.: TEST('100', 'parfor', 0, 0); -> 100 BE parfor algoritmu stacionariu sprendimu (nestac. - 1), 0 laiko iteraciju.

if matlabpool('size') == 0
	matlabpool open 
end;

Ta = 40;
S = 1;
Tk = 150;
h = 3;
Kxx = 420;
pc = 10;
dt = 0.016666667;
dinv = 0;

%N ir NP
load(char(strcat( 'Duomenys/', mat, '/N' )));
NP = length(N);

%E ir NE
load(char(strcat( 'Duomenys/', mat, '/E' )));
NE = length(E);

load(strcat( 'Duomenys/', mat, '/R' ));

main(t, N, NP, E, NE, Ta, Tk, h, Kxx, S, pc, dt, isk, dinv, R, alg); 

end
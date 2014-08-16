function [] = Grafikas( NP, T )
%Sprendini pavaizduoja grafiskai
%   Detailed explanation goes here

%faktinis
n = 1 : NP;

%vaizdavimas
plot(n, T, 'r');

%papildomi nustatymai
title('�ilumos pasiskirstymas');
xlabel('Mazg� numeriai / Laiko intervalas');
ylabel('�iluma *C');
legend('�ilumos pasiskirstymas', 'Location', 'Best' );
%saveas(gcf,'filename.jpg','jpg');
end
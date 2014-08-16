function [] = Grafikas( NP, T )
%Sprendini pavaizduoja grafiskai
%   Detailed explanation goes here

%faktinis
n = 1 : NP;

%vaizdavimas
plot(n, T, 'r');

%papildomi nustatymai
title('Ðilumos pasiskirstymas');
xlabel('Mazgø numeriai / Laiko intervalas');
ylabel('Ðiluma *C');
legend('Ðilumos pasiskirstymas', 'Location', 'Best' );
%saveas(gcf,'filename.jpg','jpg');
end
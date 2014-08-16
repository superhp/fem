classdef Grafikas
    %GRAFIKAS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)
        rez = 'rez.txt';
    end;           
        
    methods     
        function g = Grafikas()
        end;
        
        function Tekstinis(g)
            open(g.rez);
        end;
        
        function Statinis(g, NP, T)
            csvwrite(g.rez, T);
            
            %faktinis
            n = 1 : NP;
            
            %vaizdavimas
            plot(n, T', 'r');

            %papildomi nustatymai
            title('Ðilumos pasiskirstymas');
            xlabel('Mazgø numeriai / Laiko intervalas');
            ylabel('Ðiluma *C');
            legend('Ðilumos pasiskirstymas', 'Location', 'Best' );
        end;
        
        function Dinaminis(g, NP, T, isk, dinv, dinvk)
            dlmwrite(g.rez, []);
            for i = 1 : isk        
                dlmwrite(g.rez, T(:, 1, i), '-append');
                dlmwrite(g.rez, ['-'; '-'], '-append');
            end;    
            %%%Dinanimio sprendinio vaizdavimas    
            %visu pask vaizdavimas
            if dinv == 1
                g.Statinis(NP, T(:, 1, isk));
            end;
            %visu animacija
            if dinv == 12
                for i = 1 : isk
                    g.Statinis(NP, T(:, 1, i));
                    pause(0.1);    
                end;
            end;
            %Pagal mazga
            Tmzg = zeros(isk, 1);
            if dinv == 2
                for i = 1 : isk
                    Tmzg(i) = T(dinvk, 1, i);  
                end;    
                g.Statinis(isk, Tmzg);      
            end;      
        end;
    end
    
end


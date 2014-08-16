classdef Gnr1D < Gnr.Gnr
    %GNR1D Summary of this class goes here
    %   Detailed explanation goes here
           
    methods
        function g1d = Gnr1D(Eg, Ng)         
           g1d = g1d@Gnr.Gnr(Eg, Ng);          
        end;
        
        Interaktyvus(g1d, x, y);
        
        function Numatytas(g1d, tipas, n, ilg, nuo, iki, kiek)
           %elementu matrica
           g1d.E = zeros(n, 2);
           for i = 1 : n
               g1d.E(i, 1) = i;
               g1d.E(i, 2) = i + 1;
           end;
           
           %mazgu matrica
           g1d.N = zeros(n+1, 3);
           nilg = 0;
           if kiek == 0   
               nilg = ilg / n;
               g1d.N = g1d.mazgai(nilg, n, 0);   
           else
               %pirma dalis
               n1 = n - kiek;
               ilg1 = ilg - iki + nuo;
               nilg1 = ilg1 / n1;
               np = uint32(nuo / ilg1 * n1);
               g1d.N = g1d.mazgai(nilg1, np, 0);
               %antra dalis
               n2 = kiek;
               ilg2 = iki - nuo;
               nilg = ilg2 / n2;
               g1d.N = [g1d.N; g1d.mazgai(nilg, n2-1, g1d.N(np+1))];
               %trecia dalis
               n3 = n1 - np;
               g1d.N = [g1d.N; g1d.mazgai(nilg1, n3-1, g1d.N(np+n2+1))];    
           end;
           
           if tipas == 2
               g1d.Lauzte(n, nilg);
           elseif tipas == 3
               g1d.Lankas(n);
           end;
           
           g1d.Irasyti;
        end;
    end
    
    methods (Access = private)  
        
        function Lauzte(g1d, n, nilg)
            vid = uint32(n / 2);
            for i = 1 : vid + 1
                g1d.N(i,2) = nilg; 
                g1d.N(i,1) = g1d.N(i,1) + 2*nilg;
                if i == vid + 1
                    g1d.N(i,2) = nilg / 2;
                    g1d.N(i,1) = g1d.N(i,1) - nilg;
                end;
            end;                
        end;
        
        function Lankas(g1d, n)           
            %x^2+y^2=R^2
            %y=SQRT(R^2-x^2)
            T = 1 : n+1;
            R = (T(n+1) - T(1)) / 2;
            nn = uint32( (n+1)/2 );
            for i = 1 : nn
                g1d.N(i,2) = sqrt(R^2 - (T(nn-i+1))^2);
            end;
            for i = 2 : n-nn
                g1d.N(nn+i-1,2) = sqrt(R^2 - (T(i))^2);
            end;
        end;      
        
    end;    
    
    methods (Static, Access = private)
        %mazgu sudarymo f-ja
        function M = mazgai(nilg, n, pask)
            M = zeros(n+1, 3);
            for i = 1 : n + 1   
                if i == 1
                    M(i, 1) = nilg + pask;
                else
                    M(i, 1) = M(i-1, 1) + nilg;
                end;
                
            end;
        end
    end;
end
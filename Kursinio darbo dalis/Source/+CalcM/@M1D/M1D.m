classdef M1D < CalcM.CalcM
    %M1D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        kuris
        Ta
        r
        N
    end;
       
    methods
        function m1d = M1D(E, N, Ta, r, kuris, Kxx, h)         
           m1d = m1d@CalcM.CalcM(E, N);           
                 
           m1d.kuris = kuris;       
           m1d.Ta = Ta;
           m1d.r = r;
           m1d.N = N;     
           
           m1d.K = m1d.MatricaK1D(Kxx, h);
           m1d.F = m1d.Apkrovos1D(h);
        end;          
 
        function T = Statinis(m1d, Tk)             
            [m1d.K m1d.F] = m1d.Adapt(Tk, m1d.K, m1d.F);
            T = m1d.Temp();
        end;
        
        function T = Dinaminis(m1d, Tk, dinam, dt, pc, isk)
            %Deklaruojamas temperaturu T vektorius
            T = zeros(m1d.NP, 1, isk);

            %Formuojama C matrica
            %---------------------------------
            C = m1d.MatricaC1D(pc);             

            %Franko-Nikolsono
            if dinam == 1
                %Apskaiciuojama matrica P
                P = 2 / dt * C;
                %Apskaiciuojama matrica A
                A = P + m1d.K;
            else
                %Galiorkino
                A = 1/3 * m1d.K + C / (2 * dt);
            end;               

            %Apskaiciuojamas temperaturu vektorius T      
            T(:, 1, 1) = m1d.Ta; 
            T(1, 1, 1) = Tk;   %- Ar reikia???
            
            for i = 2 : isk   
                if dinam == 1
                    %Franko-Nikolsono
                    tmp = (P - m1d.K) * T(:, 1, i-1) + 2 * m1d.F;
                else
                    %Galiorkino
                    tmp = (-1/6 * m1d.K + C / (2 * dt)) * T(:, 1, i-1) + 1/2 * m1d.F;
                end;          
               
                %Modifikuoja vektorius pagal pradine temperatura       
                [A2 tmp2] = m1d.Adapt(Tk, A, tmp);    
                T(:, 1, i) = A2 \ tmp2;            
            end;    
        end;           
        
    end;
    
    methods (Access = private)
        [k f] = Adapt( m1d, Tk, k, f );
        K = MatricaK1D(m1d, Kxx, h );
        F = Apkrovos1D(m1d, h );
        C = MatricaC1D(m1d, pc );    
    end;
    
    methods (Static, Access = private)        
        Nilg     = NilgF( N, i );
    end;
    
end


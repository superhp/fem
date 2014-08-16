classdef M2D < CalcM.CalcM
    %M2D Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function m2d = M2D(E, N)         
           m2d = m2d@CalcM.CalcM(E, N);
           
           m2d.K = m2d.MatricaK2D(N, E);
           m2d.F = m2d.Apkrovos2D(N, E);           
        end;  
        
        function T = Statinis(m2d)               
            T = m2d.Temp();
        end;
    end
    
    methods (Access = private)
        K = MatricaK2D(m2d, N, E);
        F = Apkrovos2D(m2d, N, E);        
    end
    
    methods (Static, Access = private)
        [ Lij Ljk Lki ] = siena2D( E, N, i );
    end;
    
end
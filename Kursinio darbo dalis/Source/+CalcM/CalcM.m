classdef CalcM < handle
    %CALCM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties               
        NP
        NE             
    end
    
    properties (Access = protected)
        K
        F
    end
    
    methods
        function cm = CalcM(E, N)             
            cm.NP = length(N(:,1));
            cm.NE = length(E(:,1));             
        end;   
    end;
    
    methods (Access = protected)   
        function T = Temp(cm)
            T = cm.K \ cm.F;
        end;
    end
    
end
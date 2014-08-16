classdef Gnr < handle
    %GNR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = protected)      
        E
        N
        Eg
        Ng
    end
    
    methods
        function gnr = Gnr(Eg, Ng)
            gnr.Eg = Eg;
            gnr.Ng = Ng;
        end;
        
        function Irasyti(gnr)
            db = DB.DB1D;
            db.naujaLentE(gnr.Eg, gnr.E);
            db.naujaLentN(gnr.Ng, gnr.N);      
            db.Baigti;
        end;  
    end    
    
end


classdef DB2D < DB.DB
    %Duomenu bazes klasë dvimaèiam uzdaviniui
    %   Detailed explanation goes here
    
    properties     
        E          
    end
    
    methods
        %konstruktorius
        function db2d = DB2D()
            db2d = db2d@DB.DB();
            db2d.E = db2d.Elementai;            
        end;            
                     
        %elementu matricos pakeitimas
        function naujasE(db2d, naujE)
            exec(db2d.dbnfo, ['DELETE * FROM ' db2d.Epav]);
            fastinsert(db2d.dbnfo, db2d.Epav, ...
                {'m1';'m2';'m3';'s';'h1';'h2';'h3';'t1';'t2';'t3';'kxx';'kyy'},...
                naujE);
            db2d.E = naujE;
        end;        
    end   
    
    methods (Access = private)
        %elementu matricos gavimas
        function E = Elementai(db2d)
            m = fetch(db2d.dbnfo, ...
                ['select m1,m2,m3,s,h1,h2,h3,t1,t2,t3,kxx,kyy from ' db2d.Epav]);
            E = cell2mat ( m );            
        end;  
    end
    
end
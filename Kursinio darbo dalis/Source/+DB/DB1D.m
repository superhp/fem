classdef DB1D < DB.DB
    %Duomenu bazes klas4 vienmaciam uzdaviniui
    %   Detailed explanation goes here
    
    properties     
        E
        p    
    end
    
    methods
        %konstruktorius
        function db1d = DB1D()
            db1d = db1d@DB.DB();
            db1d.E = db1d.Elementai;
            db1d.p = db1d.p;
        end;        
                       
        %---NUSTATYMAS-----
        
        %nauja elementø lentele
        function naujaLentE(db1d, pv, duom)
            e = exec(db1d.dbnfo, ['CREATE TABLE ' pv ' (m1 INT, m2 INT)']);
            if size(e.Message) > 0
                exec(db1d.dbnfo, ['DROP TABLE ' pv]);
                exec(db1d.dbnfo, ['CREATE TABLE ' pv ' (m1 INT, m2 INT)']);
            end;
            fastinsert(db1d.dbnfo, pv, {'m1';'m2'}, duom);
        end;
        
        %pagrindiniu parametru nustatymas
        function set.p(db1d, naujP)               
           sql = 'WHERE ID = 1';
           update(db1d.dbnfo, 'init1d', ...
               {'Ta','Tk','knr','h','Kxx','S'}, naujP, sql);
           db1d.p = naujP;
        end;
        
        %kitu parametru nusakitymas
        function p = get.p(db1d)
            setdbprefs('DataReturnFormat','structure');
            sql = 'select Ta,Tk,knr,h,Kxx,S from init1d where ID = 1';
            p = fetch(db1d.dbnfo, sql);    
            setdbprefs('DataReturnFormat','cellarray');
        end;
        
        %elementu matricos pakeitimas
        function naujasE(db1d, naujE)
            exec(db1d.dbnfo, ['DELETE * FROM ' db1d.Epav]);
            fastinsert(db1d.dbnfo, db1d.Epav, {'m1';'m2'}, naujE);
            db1d.E = naujE;
        end;        
    end   
    
    methods (Access = private)
        %---NUSKAITYMAS-----
        
        %elementu matricos gavimas
        function E = Elementai(db1d)
            m = fetch(db1d.dbnfo, ['select m1, m2 from ' db1d.Epav]);
            E = cell2mat ( m );            
        end;      
        
    end
    
end


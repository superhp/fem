classdef DB < handle
    %DB Summary of this class goes here
    %   Detailed explanation goes here
    
    properties 
        N
    end
    
    properties (Access = protected)  
        dbnfo            
        Epav
        Npav
    end
    
    methods
        %konstruktorius - atidaroma DB ir priskiriamas jos id
        function db = DB()
            crl = 'jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=ms2k3.mdb';
            db.dbnfo = database('','','','sun.jdbc.odbc.JdbcOdbcDriver', ...
                crl);     
                        
            setdbprefs('DataReturnFormat','cellarray');
                       
            db.Epav = cell2mat( db.Bendra.Epav );
            db.Npav = cell2mat( db.Bendra.Npav );
            db.N = db.Mazgai;
        end;
        
        %nauja mazgø lentele
        function naujaLentN(db, pv, duom)
            e = exec(db.dbnfo, ['CREATE TABLE ' pv ' (x DOUBLE, y DOUBLE, z DOUBLE)']);
            if size(e.Message) > 0
                exec(db.dbnfo, ['DROP TABLE ' pv]);
                exec(db.dbnfo, ['CREATE TABLE ' pv ' (x DOUBLE, y DOUBLE, z DOUBLE)']);
            end;
            fastinsert(db.dbnfo, pv, {'x';'y';'z'}, duom);
        end;  
        
        %bendra - gauti
        function duom = Bendra(db)
            setdbprefs('DataReturnFormat','structure');
            duom = fetch(db.dbnfo, 'select * from bendra');
            setdbprefs('DataReturnFormat','cellarray');            
        end;  
        
        %bendra - nustatyti
        function naujasB(db, naujB)         
           update(db.dbnfo, 'bendra', ...
               {'dimensija','Epav','Npav','dinam','dt','isk','pc'}, ...
               naujB, '');       
           db.Epav = naujB.Epav;
           db.Npav = naujB.Npav;
        end;
        
        %bendra dinaminis var - nustatyti
        function naujasBdv(db, naujDv)         
           update(db.dbnfo, 'bendra', {'dinv','dinvk'}, naujDv, '');       
        end;
        
        
        %mazgu matricos pakeitimas
        function naujasN(db, naujN)
            exec(db.dbnfo, ['DELETE * FROM ' db.Npav]);
            fastinsert(db.dbnfo, db.Npav, {'x';'y';'z'}, naujN);
            db.N = naujN;
        end;
      
        %db uzdarymas
        function Baigti(db)
            close(db.dbnfo);
        end;
    end
    
    methods (Access = private)
        %mazgu matricos uzkrovimas
        function N = Mazgai(db)
            m = fetch(db.dbnfo, ['select x, y, z from ' db.Npav]);
            N = cell2mat ( m );            
        end;
    end;
end


classdef Tinklelis < handle
    %TINKLELIS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        N
    end 
    
    methods
        function t = Tinklelis()
            
            db = DB.DB;
            t.N = db.N;
                        
            X = t.N(:,1);
            Y = t.N(:,2);    
            
            if db.Bendra.dimensija == 1
                t.T1D(X, Y);
            end;
            if db.Bendra.dimensija == 2
                t.T2D();
            end;     
            
            db.Baigti;
            
            title('Nagrinëjamo objekto tinklelis');
            mX = max(X) * 0.1;
            mY = max(Y) * 0.1;
            set(gca,'XLim',[min(X)-mX max(X)+mX]);
            if max(Y) > 0
                set(gca,'YLim',[min(Y)-mY max(Y)+mY]);
            end;
            %set(gca,'XTick', NaN);
            %set(gca,'YTick', NaN);      
            
            dcm = datacursormode();
            datacursormode on;
            set(dcm, 'updatefcn', @papnfo);
            
            function info = papnfo(obj, event_obj)
                rez = dlmread('rez.txt');               
                pos = get(event_obj, 'Position');
                pos = [pos 0];                 %taigi negaliam naudoti Z!!! 
                mnr = strmatch(pos, t.N);      %mazgo numeris               
                info = {['Mazgo nr.:        ', num2str(mnr)], ...
                        ['Mazgo koord.:  ', ['(' num2str(pos(1))] ', '  num2str(pos(2)) ')'], ...
                        ['Temperatûra:   ', num2str(rez(uint32(mnr))), ' *C']};    %uint apsauga
            end       
        end;
    end
    
    methods (Static)
        T1D(x, y);
        T2D();  
    end;   
    
end
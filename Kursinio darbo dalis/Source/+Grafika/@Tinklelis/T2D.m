function T2D()
%TRINKLELIS2D Summary of this function goes here
%   Detailed explanation goes here

db = DB.DB2D;
NE = length(db.E(:,1));
NP = length(db.N(:,1));
N  = db.N;
E  = db.E;
db.Baigti;

nrs = zeros(1,NP);

%cla;        %isvalo langa
%hold;
for i=1 : NE
    X = [N(E(i,1),1) N(E(i,2),1) N(E(i,3),1) N(E(i,1),1)];
    Y = [N(E(i,1),2) N(E(i,2),2) N(E(i,3),2) N(E(i,1),2)];   
    plot( X, Y );      
   
    xv = (N(E(i,1),1)+N(E(i,2),1)+N(E(i,3),1)) / 3;
    yv = (N(E(i,1),2)+N(E(i,2),2)+N(E(i,3),2)) / 3;
    text(xv, yv, texlabel(num2str(i)), 'Color', 'blue');
    
    mzg = 5 * (max(N(:,1))+max(N(:,2)))/2 / 300;    %mazgo nr. atitraukimas
        
    if ~ismember(E(i,1), nrs)         
        nrs(length(nrs)+1) = E(i,1);
        text(N(E(i,1),1)-mzg, N(E(i,1),2)-mzg, texlabel(num2str(E(i,1))), 'Color', 'red');
    end;
    if ~ismember(E(i,2), nrs)         
        nrs(length(nrs)+1) = E(i,2);
        text(N(E(i,2),1)+mzg, N(E(i,2),2)-mzg, texlabel(num2str(E(i,2))), 'Color', 'red');
    end;
    if ~ismember(E(i,3), nrs)         
        nrs(length(nrs)+1) = E(i,3);
        text(N(E(i,3),1)-mzg, N(E(i,3),2)+mzg, texlabel(num2str(E(i,3))), 'Color', 'red');
    end;
    
end;
%hold off;
    
end


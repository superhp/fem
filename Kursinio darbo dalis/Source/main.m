function main()
%Pagrindine funkcija
%   Detailed explanation goes here

db = DB.DB;
g = Grafika.Grafikas;

if db.Bendra.dimensija == 1
    db = DB.DB1D;    
    Go = CalcM.M1D(db.E, db.N, db.p.Ta, db.p.S, db.p.knr, db.p.Kxx, db.p.h);
    if (db.Bendra.dinam == 0)
        T = Go.Statinis(db.p.Tk);
        g.Statinis(Go.NP, T);
        g.Tekstinis;
    else
        T = Go.Dinaminis(db.p.Tk, db.Bendra.dinam, db.Bendra.dt, db.Bendra.pc, db.Bendra.isk);
        g.Dinaminis(Go.NP, T, db.Bendra.isk, db.Bendra.dinv, db.Bendra.dinvk);
        g.Tekstinis;
    end;
else
 if db.Bendra.dimensija == 2
    db = DB.DB2D; 
    Go = CalcM.M2D(db.E, db.N);   
    if (db.Bendra.dinam == 0)
        T = Go.Statinis;
        g.Statinis(Go.NP, T);
        g.Tekstinis;
    end;    
 end;
end;

db.Baigti;

end
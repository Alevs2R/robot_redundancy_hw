function [ Result ] = Jq(fk_transform, Tbase, q, l)
    fk_transform(1:3, 4) = [0; 0; 0];
    inv_fk = fk_transform.';


    dT = Tbase * Tz(l(1)) * Rzd(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rz(q(7));
    dT = dT * inv_fk;
    Jq_1 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ryd(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rz(q(7));    
    dT = dT * inv_fk;
    Jq_2 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rzd(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rz(q(7));    
    dT = dT * inv_fk;
    Jq_3 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ryd(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rz(q(7));    
    dT = dT * inv_fk;
    Jq_4 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rzd(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rz(q(7));    
    dT = dT * inv_fk;
    Jq_5 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ryd(q(6)) * Tz(l(7)) * Rz(q(7));    
    dT = dT * inv_fk;
    Jq_6 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(l(1)) * Rz(q(1)) * Tz(l(2)) * Ry(q(2)) * Tz(l(3)) * Rz(q(3)) * Tz(l(4)) * Ry(q(4)) ...
         * Tz(l(5)) * Rz(q(5)) * Tz(l(6)) * Ry(q(6)) * Tz(l(7)) * Rzd(q(7));    
    dT = dT * inv_fk;
    Jq_7 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    Result = [Jq_1 Jq_2 Jq_3 Jq_4 Jq_5 Jq_6 Jq_7];

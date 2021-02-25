function [] = plot_robot(Tbase, q, l)

    T1 = Tbase * Tz(l(1)) * Rz(q(1));
    T2 = T1 * Tz(l(2)) * Ry(q(2));
    T3 = T2 * Tz(l(3)) * Rz(q(3));
    T4 = T3 * Tz(l(4)) * Ry(q(4));
    T5 = T4 * Tz(l(5)) * Rz(q(5));
    T6 = T5 * Tz(l(6)) * Ry(q(6));
    T7 = T6 * Tz(l(7)) * Rz(q(7));

    x = [Tbase(1,4) T1(1,4) T2(1,4) T3(1,4) T4(1,4) T5(1,4) T6(1,4) T7(1,4)];
    y = [Tbase(2,4) T1(2,4) T2(2,4) T3(2,4) T4(2,4) T5(2,4) T6(2,4) T7(2,4)];
    z = [Tbase(3,4) T1(3,4) T2(3,4) T3(3,4) T4(3,4) T5(3,4) T6(3,4) T7(3,4)];

    line(x,y,z);

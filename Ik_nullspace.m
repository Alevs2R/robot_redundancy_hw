function [ new_q ] = Ik_nullspace(delta_r, q, l, Tbase)
    fk_transform = Fk(Tbase, q, l);
    
    jacobian = Jq(fk_transform, Tbase, q, l);
    H = H_manipulability(fk_transform, Tbase, q, l);

    delta_q = 0.001;

    H1 = H_manipulability(fk_transform, Tbase, q+[delta_q 0 0 0 0 0 0]', l);
    dH1 = (H1-H) / delta_q;

    H2 = H_manipulability(fk_transform, Tbase, q+[0 delta_q 0 0 0 0 0]', l);
    dH2 = (H2-H) / delta_q;

    H3 = H_manipulability(fk_transform, Tbase, q+[0 0 delta_q 0 0 0 0]', l);
    dH3 = (H3-H) / delta_q;

    H4 = H_manipulability(fk_transform, Tbase, q+[0 0 0 delta_q 0 0 0]', l);
    dH4 = (H4-H) / delta_q;

    H5 = H_manipulability(fk_transform, Tbase, q+[0 0 0 0 delta_q 0 0]', l);
    dH5 = (H5-H) / delta_q;

    H6 = H_manipulability(fk_transform, Tbase, q+[0 0 0 0 0 delta_q 0]', l);
    dH6 = (H6-H) / delta_q;

    H7 = H_manipulability(fk_transform, Tbase, q+[0 0 0 0 0 0 delta_q]', l);
    dH7 = (H7-H) / delta_q;

    dH = [dH1 dH2 dH3 dH4 dH5 dH6 dH7]';

    Jinv = pinv(jacobian);

    delta_q_vec = Jinv*delta_r + (eye(7) - Jinv*jacobian)*dH;

    new_q = q+delta_q_vec;;
    
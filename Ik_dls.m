function [ new_q ] = Ik_dls(delta_r, q, l, Tbase, mu_square)
    fk_transform = Fk(Tbase, q, l);
    
    jacobian = Jq(fk_transform, Tbase, q, l);

    # remove zero rows
    % jacobian = jacobian([1,2,6], :);

    K = jacobian'*inv(jacobian*jacobian' + mu_square*eye(6));

    delta_q = K*delta_r;
    new_q = q+delta_q;
    new_q = q+delta_q;
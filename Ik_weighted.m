function [ new_q ] = Ik_weighted(delta_r, q, l, Tbase, W)
    fk_transform = Fk(Tbase, q, l);
    
    jacobian = Jq(fk_transform, Tbase, q, l);

    # remove zero rows
    % jacobian = jacobian([1,2,6], :);

    K = inv(W)*jacobian'*inv(jacobian*inv(W)*jacobian');

    delta_q = K*delta_r;
    new_q = q+delta_q;
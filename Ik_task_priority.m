function [ new_q ] = Ik_task_priority(target_pos, q, l, Tbase)
    fk_transform = Fk(Tbase, q, l);
    delta_r_1 = target_pos - fk_transform(1:3,4);

    jacobian = Jq(fk_transform, Tbase, q, l);

    # keep only position jacobians, not orientation
    jacobian_1 = jacobian([1,2,3], :);
    K_1 = jacobian_1'*inv(jacobian_1*jacobian_1' + 10e-4*eye(3)); # dls solution for 1 task
    P_1 = (eye(7) - K_1*jacobian_1); 

    jacobian_2 = jacobian([4,5], :);
    eul = rotmat2eulang(fk_transform(1:3, 1:3), "XYZ");
    delta_r_2 = -eul(1:2)';


    delta_q = K_1*delta_r_1 + pinv(jacobian_2*P_1)*(delta_r_2 - jacobian_2*(K_1*delta_r_1));
    new_q = q+delta_q;
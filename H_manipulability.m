function [ Result ] = H_manipulability(fk, Tbase, q, l)
    jq = Jq(fk, Tbase, q, l);
    Result = sqrt(det(jq*(jq')));

clf();
clear();
axis equal;
figure(1);
hold on;
format long g
graphics_toolkit("gnuplot")

l = [0.340 0.2 0.2 0.2 0.2 0.2 0.1264]';

Tbase = eye(4);

q = [0 pi/6 0 pi/6 0 pi/6 0]';
plot_robot(Tbase, q, l);

% W = eye(7);
% W(7,7) = 10;

iterations = 10;

q_list = zeros(10,7)

for i = 1:iterations
    delta_r = [-1.0/iterations 0.0 0.0 0.0 0.0 0.0]';
    % q = Ik_weighted(delta_r, q, l, Tbase, W)
    q = Ik_nullspace(delta_r, q, l, Tbase);
    plot_robot(Tbase, q, l);
    % q_list(end+1) = q'
    q_list(i,:) = q

end

xlabel("X axis");
ylabel("Y axis");
zlabel("Z axis");
view(-30,45)
rotate3d on
graphics_toolkit("gnuplot");
saveas(gcf,"inverse_nullspace_2.png")
% plot(1:iterations, q_list(:,1))
% plot(1:iterations, q_list(:,3))
% plot(1:iterations, q_list(:,5))
% legend("joint 1", "joint 3", "joint 5")
% saveas(gcf, "inv_weighted_w3_10.png")


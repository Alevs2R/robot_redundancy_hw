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
    delta_r = [-1.0/iterations 0.0 0.0]';
    q = Ik_nullspace(delta_r, q, l, Tbase);
    plot_robot(Tbase, q, l);
    q_list(i,:) = q
end

xlabel("X axis");
ylabel("Y axis");
zlabel("Z axis");
view(-30,30)
rotate3d on
graphics_toolkit("gnuplot");
saveas(gcf,"inverse_nullspace.png")

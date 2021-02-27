clf();
clear();
format long g
graphics_toolkit("fltk")
h = figure;


l = [0.340 0.2 0.2 0.2 0.2 0.2 0.1264]';

Tbase = eye(4);

q = [0 2.3*pi/3 0 -pi/3 0 -pi/3 0]';
plot_robot(Tbase, q, l);

filename = 'inverse_task_priority.gif';

axis tight manual % this ensures that getframe() returns a consistent size

xlabel("X axis");
ylabel("Y axis");
zlabel("Z axis");
xlim([0 1.5]); zlim([0 1.5]);
view(0,0)
grid on

drawnow;
frame = getframe(h); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im); 
imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 

delta_r = zeros(3,40);
step_size = 0.05;
delta_r(:,1:10) = repmat([-step_size; 0.0; 0.0], [1,10]);
delta_r(:,11:20) = repmat([0.0; 0.0; step_size], [1,10]);
delta_r(:,21:30) = repmat([step_size; 0.0; 0.0], [1,10]);
delta_r(:,31:40) = repmat([0.0; 0.0; -step_size], [1,10]);

fk_transform = Fk(Tbase, q, l);
target_pos = fk_transform(1:3,4);

for i = 1:length(delta_r)
    target_pos += delta_r(:,i);
    q = Ik_task_priority(target_pos, q, l, Tbase);
    plot_robot(Tbase, q, l);

    % Capture the plot as an image 
    drawnow;
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im); 

    % Write to the GIF File 
    imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1); 
end

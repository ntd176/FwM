% setup parameters
figure;
% pause(5);
t=0:0.01:pi;
% outer, inner radius
outer_radius = [8, 7, 6, 5, 4, 3, 2];
inner_radius = [7, 6, 5, 4, 3, 2, 1];
% color
colors = {
    [1, 0, 0],                  %red
    [1, 0.5, 0],                %orange
    [1, 1, 0],                  %yellow
    [0, 1, 0],                  %green
    [0.5843, 0.8157, 0.9882],   %light blue
    [0, 0, 1],                  %blue
    [0.4039, 0.0078, 0.3686]    %violet
}
% draw using the loop
hold on;

for i = 1:length(outer_radius)

    r_outer = outer_radius(i);
    r_inner = inner_radius(i);
    color = colors{i};

    % mathematical principle (polar coordinates to cartesian coordinates)
    x_outer = r_outer * cos(t);
    y_outer = r_outer * sin(t);

    x_inner = r_inner * cos(t);
    y_inner = r_inner * sin(t);
    
    % reverse
    x_band = [x_outer, fliplr(x_inner)];
    y_band = [y_outer, fliplr(y_inner)];

    patch(x_band, y_band, color, 'EdgeColor', 'none');  
end

axis equal;
axis off;
title('RainBow Matlab');

hold off;
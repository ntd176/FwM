% Nguyên lý: vẽ liên tiếp các hình tròn tô màu chồng lên nhau với tâm các
% hình tròn di chuyển dọc trên đường cong sin và -sin

% --- khởi tạo ---
t = -5*pi:0.1:5*pi;
x = sin(t);
z = -sin(t);

% --- Tạo vector theta ---
theta = linspace(0, 2*pi, 50);
% Tính toán 50 cặp toạ độ (x, y) => mỗi cặp là 1 vị trí trên CV hình tròn
circle_x = 0.5 * cos(theta);
circle_y = 0.5 * sin(theta);

figure;
hold on;
axis equal;

% --- Giới hạn trục toạ độ ---
axis([-5*pi-1, 5*pi+1, -1.5-0.5, 1.5+0.5]);
grid on;
xlabel('t');
ylabel('sin(t) / -sin(t)');
title('Sin Waveform RUN');

% --- Loop ---
for i = 1:length(t)     % Lặp qua từng giá trị trong vector t
    
    center_x = t(i);
    center_y1 = x(i); 
    center_y2 = z(i); 

    fill(center_x + circle_x, center_y1 + circle_y, 'm', 'EdgeColor', 'none');

    fill(center_x + circle_x, center_y2 + circle_y, 'g', 'EdgeColor', 'none');

    pause(0.01);
end
hold off;
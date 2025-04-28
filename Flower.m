%  --- setup khung vẽ ---
figure('Name', 'Bong Hoa Vien Mau 2D', 'NumberTitle', 'off', 'Color', 'w');
axis equal off;
hold on;
view(2);
colormap(hsv);

% --- tham số bông hoa ---
so_lop = 7;                       % số lớp cánh hoa
r_max = 10;                       % bán kính lớn bông hoa
so_diem_tren_vien = 400;          % số điểm trên viền cánh hoa để mượt hơn
k = 5;                            % điều khiển hình dạng và số lượng cánh hoa
goc_xoay = pi / 15;               % góc xoay giữa các lớp cánh hoa (12 độ)
r_giam = r_max / (so_lop + 1);    % giảm bán kình cho mỗi lớp cánh hoa
time_pause_each_layer = 0.15;     % thời gian dừng giữa các lớp
center_color = [1, 0.6, 0];       % (1, 0.6, 0): cường độ màu đỏ, xanh lá, xanh dương => cam ở nhuỵ hoa 
do_day_vien = 1.5;                % độ dày đường viền

% --- vẽ lớp cánh hoa ---
r_current = r_max;          % khởi tạo lớp cánh hoa đầu tiên
goc_current = 0;            % khởi tạo góc xoay ban đầu
colors = hsv(so_lop);       % tạo dãy màu sắc sử dụng cho các lớp cánh hoa
fprintf('Đang vẽ bông hoa (viền màu)...\n');

for layer = 1:so_lop
    % mỗi lớp sẽ có mỗi cánh khác nhau tuỳ vào người thiết kế
    i = k + mod(layer, 3) - 1;

    if i <= 0; i = 1; 
    end

    if mod(k, 2) == 0
        so_canh = 2 * i;    % số cánh thực tế
    else
        so_canh = i;
    end

    % theta phân bố đều trong 1 vòng tròn từ 0 đến 2pi
    % 5 cánh hoá * 100 điểm mỗi cánh = 500 góc theta từ 0 --> 2pi
    theta = linspace(0, 2*pi, so_diem_tren_vien * so_canh);
    r_layer = r_current * abs(cos(k * theta));

    x_layer = r_layer .* cos(theta + goc_current);
    y_layer = r_layer .* sin(theta + goc_current);

    % --- vẽ viền lớp cánh hoa bằng PLOT ---
    plot(x_layer, y_layer, ...
         'Color', colors(layer, :), ...
         'LineWidth', do_day_vien);

    % --- hiệu ứng ---
    drawnow;
    fprintf('Đã vẽ viền lớp %d/%d\n', layer, so_lop);
    pause(time_pause_each_layer); % dừng 1 chút

    % --- cập nhập tham số tiếp theo ---
    r_current = r_current - r_giam;
    goc_current = goc_current + goc_xoay;
end

% --- vẽ viền nhuỵ hoa ---
r_center = r_giam * 0.8;
center_theta = linspace(0, 2*pi, 100);
center_x = r_center * cos(center_theta);
center_y = r_center * sin(center_theta);

plot(center_x, center_y, ...
     'Color', center_color, ...
     'LineWidth', do_day_vien * 0.8); % *0.8 để viền mỏng (tuỳ chọn)

fprintf('Hoàn thành!\n');
hold off;
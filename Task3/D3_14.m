theta = linspace(0, 2*pi, 1000); % 定义θ的范围
a = 3; % 取学号末尾数字
x = a * (1 - cos(theta)) .* cos(theta); % 计算x的值
y = a * (1 - cos(theta)) .* sin(theta); % 计算y的值

figure(1); % 创建新的图形窗口   
plot(x, y); % 在图形窗口中绘制心形线
title('心形线'); % 给图形添加标题

[x, y] = meshgrid(-2:0.1:2, -2:0.1:2); % 定义x和y的范围
b = randi([1, 10]); % 取1到10之间的随机整数
z = (x.^2/a^2 - y.^2/b^2)/2; % 计算z的值

figure(2); % 创建新的图形窗口
surf(x, y, z); % 在图形窗口中绘制马鞍面
title('马鞍面'); % 给图形添加标题

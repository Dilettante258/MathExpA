% 定义x的范围
x = linspace(0, 2*pi, 100);
% 计算y1和y2的值
y1 = 2*exp(-0.5*x);
y2 = cos(4*pi*x);

plot(x, y1, 'r--', 'DisplayName', 'Y1')
hold on
plot(x, y2, 'b-', 'DisplayName', 'Y2')

% 添加图例
legend
text(0.8, 1.5, '曲线 y1=2e^{-0.5x}')
text(2.5, 1.1, '曲线 y2=cos(4{\pi}x)')
xlabel('Variable X')
ylabel('Variable Y')

hold off

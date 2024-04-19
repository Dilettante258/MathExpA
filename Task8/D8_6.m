% 定义时刻和温度数据
time = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
temperature = [15 14 14 14 14 15 16 18 20 22 23 25 28 31 32 31 29 27 25 24 22 20 18 17 16];

% 定义拟合函数
fitfun = @(p, t) p(1)*sin(2*pi*t/24 + p(2)) + p(3);

% 初始参数猜测
p0 = [10, 0, 20]; % A, phi, B

% 使用lsqcurvefit进行非线性最小二乘拟合
p = lsqcurvefit(fitfun, p0, time, temperature);

% 显示拟合的参数
disp(['振幅 A = ', num2str(p(1))])
disp(['相位偏移 φ = ', num2str(p(2))])
disp(['平均温度 B = ', num2str(p(3))])
str_ = sprintf("$$T(t)=%6.2f\\cdot\\sin(\\frac{2\\pi }{24}+%6.2f)+%6.2f$$",p(1),p(2),p(3));

% 生成拟合的温度数据
fit_temperature = fitfun(p, time);

% 绘制原始数据和拟合数据
figure
plot(time, temperature, 'o') % 原始数据
hold on
plot(time, fit_temperature, '-') % 拟合数据

xlabel('时间 (小时)')
ylabel('温度 (℃)')
legend('原始数据', '拟合数据', 'Location', 'Best')
title('温度与时间的关系')
text(10, 16, str_,'Interpreter','latex')
hold off


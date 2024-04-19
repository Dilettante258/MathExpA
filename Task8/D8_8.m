% 已知数据
T = [700,720,740,760,780];
V = [0.0977, 0.1218, 0.1406, 0.1551, 0.1664];

% 插值求解的温度点
T_query = [750, 770];

% 线性插值
V_linear = interp1(T, V, T_query, 'linear');

% 三次样条插值
V_spline = interp1(T, V, T_query, 'spline');

% 输出插值结果
fprintf('在T=750时，线性插值、三次样条插值得到的体积变化为：%.4f, %.4f\n', V_linear(1),V_spline(1));
fprintf('在T=770时，线性插值、三次样条插值得到的体积变化为：%.4f, %.4f\n', V_linear(2), V_spline(2));

% 生成插值函数的图形
T_fine = linspace(min(T), max(T), 500); % 细分的温度区间，用于画图
V_linear_fine = interp1(T, V, T_fine, 'linear'); % 细分区间的线性插值结果
V_spline_fine = interp1(T, V, T_fine, 'spline'); % 细分区间的三次样条插值结果

figure;
hold on; % 保持当前图形
plot(T, V, 'ko', 'MarkerSize', 10); % 原始数据点
plot(T_fine, V_linear_fine, 'r-'); % 线性插值函数
plot(T_fine, V_spline_fine, 'b-'); % 三次样条插值函数
legend('原始数据', '线性插值', '三次样条插值','Location','east'); % 图例
xlabel('T'); ylabel('V'); 
title('线性插值与三次样条插值的比较');
grid on;
hold off;
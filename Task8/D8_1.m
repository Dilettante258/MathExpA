% 题1
clear;clc;
% 数据
x = [0, 0.2, 0.4, 0.6, 0.8, 1];
y = [4, 4.5, 5, 6, 6.8, 7.7];

% 定义模型函数
fun = @(p,x) 3 + p(1)*x + exp(p(2)*x);

% 初始猜测值
p0 = [1, 1];

% 使用 lsqcurvefit 进行拟合
[p,resnorm,residual,exitflag,output] = lsqcurvefit(fun, p0, x, y);

% 打印结果
disp(['a = ', num2str(p(1))]);
disp(['b = ', num2str(p(2))]);

% 作出拟合效果图
xmodel = linspace(min(x), max(x), 100);
ymodel = fun(p, xmodel);

figure;
plot(x, y, '*'); % 数据点
hold on;
plot(xmodel, ymodel, 'b-'); % 拟合曲线
xlabel('x'); % x轴标签
ylabel('y'); % y轴标签
title('非线性最小二乘拟合'); % 标题
legend('数据', '拟合曲线', 'Location', 'best'); % 图例
hold off;
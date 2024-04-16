% 定义x，y的范围
x = linspace(-2*pi, 2*pi, 100);
y = linspace(-2*pi, 2*pi, 100);
% 创建网格
[X, Y] = meshgrid(x, y);
% 计算Z的值，注意在y=0处进行除数异常处理
Z = (cos(X).*sin(Y))./(Y + (Y==0));
% 绘制曲面
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
str = 'Surface plot of $$ z = \frac{cos(x)sin(y)}{y} $$';
title(str,'Interpreter','latex')


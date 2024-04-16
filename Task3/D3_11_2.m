% 定义x和y的范围
x = -10:0.5:10; y = -10:0.5:10;
% 使用meshgrid函数生成网格点
[X,Y] = meshgrid(x, y);
% 计算每个网格点的z值
Z = X.^3 + Y.^3;
% 使用surf函数绘制图形
surf(X,Y,Z)
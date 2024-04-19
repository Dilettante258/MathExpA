% 初始化x和y的坐标
x = 100:100:500;
y = 100:100:400;

% 初始化高程数据
Z = [636 697 624 478 450;
     698 712 630 478 420;
     680 674 598 412 400;
     662 626 552 334 310];

% 创建一个更精细的网格,以备插值
xq = 100:10:500;
yq = 100:10:400;

% 对高程数据进行插值
Zq = interp2(x,y,Z,xq,yq','cubic');

% 找到最高点的坐标和高程
[maxZ, idx] = max(Zq(:));
[xInd, yInd] = ind2sub(size(Zq), idx);
maxX = xq(xInd);
maxY = yq(yInd);

% 输出结果
fprintf('最高点的坐标为 (%d, %d)，高程为 %f\n', maxX, maxY, maxZ);

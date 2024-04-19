X=0:40:560;
Y=0:40:480;
[x,y]=meshgrid(X,Y);
z=[37 47 55 60 67 69 67 62 58 45 40 30 10 15 25
    51 62 73 80 85 87 85 78 72 65 50 20 30 35 32 
    65 76 88 97 102 105 102 83 80 70 30 50 55 48 35 
    74 88 108 113 125 128 123 104 90 50 70 78 75 65 55 
    83 98 118 132 145 142 140 130 70 90 85 84 38 78 75 
    88 106 123 139 150 150 140 90 110 106 95 87 90 93 95 
    91 109 127 150 120 110 135 145 120 115 101 88 100 105 110 
    95 119 137 150 120 110 155 160 155 138 107 90 105 115 120 
    143 145 146 150 155 160 155 160 160 160 155 150 150 155 155 
    142 143 145 148 150 155 151 143 130 120 98 85 75 55 50 
    138 141 143 145 147 132 128 120 108 94 78 62 46 37 35 
    137 139 141 143 144 114 111 105 95 82 69 54 38 30 21 
    135 137 139 140 141 96 94 88 80 69 57 43 29 21 15];
% mesh(x,y,z)
%% 
xi=linspace(-3,3,300);
xi=0:10:560;yi=0:10:480;
[XI,YI]=meshgrid(xi,yi);
ZI=interp2(x,y,z,XI,YI,'spline');


figure %生成图窗
set(gcf,'position',[250 300 1000 400])

subplot(1,2,1);
mesh(XI,YI,ZI);
hold on;
% 箭头矢量的大小
vector_size = 15;

% 山峰、山谷和溪流的位置
peak = [192, 332, interp2(XI, YI, ZI, 192, 332)];
valley = [176, 268, interp2(XI, YI, ZI, 176, 268)];
stream_source = [240, 216, interp2(XI, YI, ZI, 240, 216)];

% 调整摄影机位置
campos([873.7  -1632.6  1648]);

% 在地形图上标记山峰、山谷和溪流
quiver3(peak(1), peak(2), peak(3), vector_size, vector_size, vector_size+15, 'r', 'LineWidth', 1.5, "Marker","x");
text(peak(1), peak(2), peak(3) + 50, '山峰', 'Color', 'r');

quiver3(valley(1), valley(2), valley(3), -vector_size, -vector_size, vector_size+20, 'Color', [0.9290 0.6940 0.1250],'LineWidth', 1.5, "Marker","x");
text(valley(1)-50, valley(2)-20, valley(3) + 50, '山谷', 'Color', [0.9290 0.6940 0.1250]);

quiver3(stream_source(1), stream_source(2), stream_source(3), vector_size, vector_size, vector_size, 'b', 'LineWidth', 1.5, "Marker","x");
text(stream_source(1)+20, stream_source(2)+10, stream_source(3) + 25, '溪流源头', 'Color', 'b');
title('山区地势图');
text(400, 700, '比例尺: 1:10', 'Color', 'k');
hold off;
%%
subplot(1,2,2);
h=contour(XI,YI,ZI);
clabel(h)
title('山区平面图')
result = [XI,YI,ZI];
disp("插值出的每100m的网格数据已存放在result中！")

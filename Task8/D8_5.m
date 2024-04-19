% 定义X和Y的数据
X = [1, 1.1, 1.2, 1.3, 1.4];
Y = [1, 1.2337, 1.5527, 1.9937, 2.6117];

% 定义一个新的X值，用于插值
Xq = 1:0.01:1.4;

% 线性插值
Yq_linear = interp1(X, Y, Xq, 'linear');
%disp('线性插值结果:');
%disp([Xq; Yq_linear]);

% 多项式插值
P = polyfit(X, Y, length(X) - 1);
Yq_poly = polyval(P, Xq);
%disp('多项式插值结果:');
%disp([Xq; Yq_poly]);

% 三次样条插值
Yq_spline = interp1(X, Y, Xq, 'spline');
disp('三次样条插值结果:');
disp([Xq; Yq_spline]);
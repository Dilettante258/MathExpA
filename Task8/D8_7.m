t = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
y = [4 6.4 8 8.8 9.22 9.5 9.7 9.86 10 10.2 10.32 10.32 10.5 10.55 10.58 10.6];

% 二次拟合
p2 = polyfit(t, y, 2);
y2 = polyval(p2, t);

% 三次拟合
p3 = polyfit(t, y, 3);
y3 = polyval(p3, t);

% 六次拟合
p6 = polyfit(t, y, 6);
y6 = polyval(p6, t);

% 定义损失函数
loss_func1 = @(param) sum((y - (t./(param(1)*t + param(2)))).^2);
loss_func2 = @(param) sum((y - param(1)*exp(param(2)./t)).^2);

% 使用fminsearch找到最小化损失函数的参数
param1 = fminsearch(loss_func1, [1, 1]);
param2 = fminsearch(loss_func2, [1, -1]);

% 计算拟合的y值
y1 = t./(param1(1)*t + param1(2));
y2 = param2(1)*exp(param2(2)./t);


% 画出原始数据
plot(t, y, 'ko'); hold on;

% 画出拟合曲线
plot(t, y2, 'r-'); 
plot(t, y3, 'g-'); 
plot(t, y6, 'b-'); 
plot(t, y1, 'c-'); 
plot(t, y2, 'm-'); 

% 添加图例
legend('Original Data', '2nd Order Fit', '3rd Order Fit', '6th Order Fit', 'phi1 Fit', 'phi2 Fit',"Location","east");

% 关闭hold
hold off;


% 输出二次拟合的函数
fprintf('二次拟合函数：y = %f * t^2 + %f * t + %f\n', p2(1), p2(2), p2(3));

% 输出三次拟合的函数
fprintf('三次拟合函数：y = %f * t^3 + %f * t^2 + %f * t + %f\n', p3(1), p3(2), p3(3), p3(4));

% 输出六次拟合的函数
fprintf('六次拟合函数：y = %f * t^6 + %f * t^5 + %f * t^4 + %f * t^3 + %f * t^2 + %f * t + %f\n', p6(1), p6(2), p6(3), p6(4), p6(5), p6(6), p6(7));

% 输出非线性拟合的函数
fprintf('phi1拟合函数：y = t / (%f * t + %f)\n', param1(1), param1(2));
fprintf('phi2拟合函数：y = %f * exp(%f / t)\n', param2(1), param2(2));

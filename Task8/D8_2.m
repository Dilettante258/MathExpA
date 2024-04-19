clear;clc;
% 输入数据
x = [2, 3, 4, 5, 7, 8, 10, 11, 14, 15, 15, 18, 19];
y = [106.42, 109.2, 109.58, 109.5, 110, 109.93, 110.49, 110.59, 110.6, 110.9, 110.76, 111, 111.2];

% 创建散点图
scatter(x, y,"*")
xlabel('距离') % x轴标签
ylabel('金属含量') % y轴标签
title('距离与金属含量的散点图') % 图标题
hold on;

% 线性拟合
[P1,S1] = polyfit(x,y,1);
Y1 = polyval(P1,x);
plot(x,Y1,'b','linewidth',2);
RSS1 = sum((Y1 - y).^2);
str1 = sprintf('线性拟合: y = %.2fx + %.2f, RSS = %.2f', P1(1), P1(2), RSS1);

% 二次拟合
[P2,S2] = polyfit(x,y,2);
[Y2,delta2] = polyconf(P2,x,S2);
plot(x,Y2,'r','linewidth',2);
RSS2 = sum((Y2 - y).^2);
str2 = sprintf('二次拟合: y = %.2fx^2 + %.2fx + %.2f, RSS = %.2f', P2(1), P2(2), P2(3), RSS2);

% 对数拟合
log_x = log(x);
[P_log,S_log] = polyfit(log_x,y,1);
Y_log = polyval(P_log,log_x);
plot(x,Y_log,'g','linewidth',2);
RSS_log = sum((Y_log - y).^2);
str_log = sprintf('对数拟合: y = %.2flog(x) + %.2f, RSS = %.2f', P_log(1), P_log(2), RSS_log);

% 双曲线拟合
inv_x = 1./x;
[P_hyp,S_hyp] = polyfit(inv_x,y,1);
Y_hyp = polyval(P_hyp,inv_x);
plot(x,Y_hyp,'m','linewidth',2);
RSS_hyp = sum((Y_hyp - y).^2);
str_hyp = sprintf('双曲线拟合: y = %.2f/x + %.2f, RSS = %.2f', P_hyp(1), P_hyp(2), RSS_hyp);

% 选择最优拟合曲线
RSSs = [RSS1, RSS2, RSS_log, RSS_hyp];
[min_RSS, idx] = min(RSSs);

fprintf('最优拟合曲线为\n');
switch idx
    case 1
        disp(str1);
        str1 = [str1,' (最优)'];
    case 2
        disp(str2);
        str2 = [str2,' (最优)'];
    case 3
        disp(str_log);
        str_log = [str_log,' (最优)'];
    case 4
        disp(str_hyp);
        str_hyp = [str_hyp,' (最优)'];
end

xlabel('样点与原点的距离');
ylabel('金属含量');
legend({'数据散点图',str1, str2, str_log, str_hyp},'Location','southeast');
hold off;

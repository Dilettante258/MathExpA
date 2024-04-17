# 作业6 应用微积分(课本第五章)

## 1(课本习题3)

作图表示函数$z = x\ e^{- x^{2} - y^{3}}$​(-1\<x\<1,0\<y\<2)沿x方向的梯度。

```matlab
% 定义x和y的范围
x = linspace(-1, 1, 100);
y = linspace(0, 2, 100);
% 创建一个网格
[X, Y] = meshgrid(x, y);
% 计算z值
Z = X .* exp(-X.^2 - Y.^3);
% 计算梯度
[Gx, Gy] = gradient(Z);
% 绘制x方向的梯度
figure
surf(X, Y, Gx)
title('Gradient in x direction')
xlabel('x'),ylabel('y'),zlabel('Gradient')
```

输出：

<img src="https://pic.wang1m.tech/uploads/2404/661f7e617e820.png" alt="1" style="width:400px;" />



## 2(课本习题5)

求下列积分的数值解：

(1)$\int_{0}^{1}{\frac{1}{\sqrt{2\pi}}e^{- \frac{x^{2}}{2}}}dx$    (习题5.1）​

(2)$\int_{0}^{2\pi}{e^{2x}\cos^{3}x}dx$    (习题5.2）

\(3\) $\int_{0}^{1}\sqrt{2x - x^{2}}dx$​ 

(4)$\int_{- \frac{\pi}{2}}^{\frac{\pi}{2}}{\left( x^{3} + \sin^{2}x \right)\cos^{2}x}dx$​

(5) $\int_{0}^{1}{x\left( 1 - x^{4} \right)^{\frac{3}{2}}}dx$​

代码：

```matlab
% 2.1
f = @(x) (1/sqrt(2*pi))*exp(-x.^2/2);
result1 = integral(f, 0, 1)
% 2.2
fun=@(x)exp(2*x).*cos(x).^3;
result2 = integral(fun,0,2*pi)
% 2.3
f = @(x) sqrt(2*x - x.^2);
result3 = integral(f, 0, 1)
% 2.4
f = @(x) (x.^3 + sin(x).^2).*cos(x).^2;
result4 = integral(f, -pi/2, pi/2)
% 2.5
f = @(x) x.*(1 - x.^4).^(3/2);
result5 = integral(f, 0, 1)
```

输出：

> result1 = 0.3413
> result2 = 9.7054e+04
> result3 = 0.7854
> result4 = 0.3927
> result5 = 0.2945

## 3(课本习题6)

(椭圆的周长)用数值积分法计算椭圆$\frac{x^{2}}{4} + \frac{y^{2}}{9} = 1$的周长。

```matlab
t=linspace(0,2*pi,100);
x=2*cos(t);
y=3*sin(t);
dx=gradient(x,t);
dy=gradient(y,t);
f=sqrt(dx.^2+dy.^2);
perimeter = trapz(t,f)
```

输出：

> perimeter = 15.8548

## 课本其他习题

该章其他习题：

```matlab
% Exercise 1: 计算梯形积分
x = [0 4 10 12 15 22 28 34 40];
y = [0 1 3 6 8 9 5 3 0];
trapz(x, y) % 使用 trapz 函数计算梯形积分

% Exercise 2: 计算差分
x = [0 4 10 12 15 22 28 34 40];
y = [0 1 3 6 8 9 5 3 0];
diff(y) ./ diff(x) % 使用 diff 函数计算差分

% Exercise 3: 参考 Exercise 1

% Exercise 4: 计算梯度和最小值
t = 0:0.01:1.5;
x = log(cos(t));
y = cos(t) - t .* sin(t);
dydx = gradient(y, x); % 计算梯度
[x_1, id] = min(abs(x - (-1))); % 找到最接近 x=-1 的点
dydx(id)

% Exercise 5(2): 使用匿名函数进行积分
fun = @(x) exp(2 * x) .* cos(x) .^ 3;
quadl(fun, 0, 2 * pi) % 使用 quadl 函数进行积分
% 或者使用 trapz 函数
x = linspace(0, 2 * pi, 100);
y = exp(2 * x) .* cos(x) .^ 3;
trapz(x, y)

% Exercise 5(3): 使用匿名函数进行积分
fun = @(x) x .* log(x .^ 4) .* asin(1 ./ x .^ 2);
quadl(fun, 1, 3) % 使用 quadl 函数进行积分
% 或者使用 trapz 函数
x = 1:0.01:3;
y = feval(fun, x);
trapz(x, y)

% Exercise 5(4): 使用匿名函数进行积分
fun = @(x) sin(x) ./ x;
quadl(fun, 1e-10, 1) % 注意下限为0，使用很小的1e-10代替

% Exercise 5(6): 双重积分
fun = @(r, th) sqrt(1 + r .^ 2 .* sin(th));
dblquad(fun, 0, 1, 0, 2 * pi) % 使用 dblquad 函数进行双重积分

% Exercise 5(7): 首先建立84页函数 dblquad2，然后进行积分
clear;
fun = @(x, y) 1 + x + y .^ 2;
clo = @(x) -sqrt(2 * x - x .^ 2);
dup = @(x) sqrt(2 * x - x .^ 2);
dblquad2(fun, 0, 2, clo, dup, 100)

% Exercise 6: 计算曲线长度
%% 参见题3

% Exercise 7: 计算曲面面积
xa = -1:0.1:1;
ya = 0:0.1:2;
[x, y] = meshgrid(xa, ya);
z = x .* exp(x .^ 2 + y .^ 2);
[zx, zy] = gradient(z, xa, ya);
f = sqrt(1 + zx .^ 2 + zy .^ 2);
s = 0;
for i = 2:length(xa)
    for j = 2:length(ya)
        s = s + (xa(i) - xa(i-1)) * (ya(j) - ya(j-1)) * (f(i, j) + f(i-1, j) + f(i, j-1) + f(i-1, j-1)) / 4;
    end
end
s

% Exercise 8: 使用匿名函数进行积分
funl = @(x) -(-x) .^ 0.2 .* cos(x);
funr = @(x) x .^ 0.2 .* cos(x);
quadl(funl, -1, 0) + quadl(funr, 0, 1) % 使用 quadl 函数进行积分

% Exercise 9: 比较不同积分方法的结果
fun = @(x) abs(sin(x));
h = 0.1;
x = 0:h:32 * pi;
y = feval(fun, x);
t1 = trapz(x, y) % 使用 trapz 函数进行积分
h = pi;
x = 0:h:32 * pi;
y = feval(fun, x);
t2 = trapz(x, y) % 步长与周期一致，结果失真
q1 = quad(fun, 0, 32 * pi) % 使用 quad 函数进行积分
q2 = quadl(fun, 0, 32 * pi) % 使用 quadl 函数进行积分

% Exercise 10(2): 使用改进的数值微分方法
function d = ex5_10_2f(fname, a, h0, e)
h = h0;
d = (feval(fname, a + h) - 2 * feval(fname, a) + feval(fname, a - h)) / (h * h);
d0 = d + 2 * e;
while abs(d - d0) > e
    d0 = d;
    h0 = h;
    h = h0 / 2;
    d = (feval(fname, a + h) - 2 * feval(fname, a) + feval(fname, a - h)) / (h * h);
end
fun = @(x) x .^ 2 .* sin(x .^ 2 - x - 2);
d = ex5_10_2f(fun, 1.4, 0.1, 1e-3)

% Exercise 11: 提示：f 上升时，f' > 0；f 下降时，f' < 0；f 极值，f' = 0.

% Exercise 12: 使用 Simpson 法则进行积分
function I = ex5_12(fname, a, b, n)
x = linspace(a, b, n + 1);
y = feval(fname, x);
I = (b - a) / n / 3 * (y(1) + y(n + 1) + 2 * sum(y(3:2:n)) + 4 * sum(y(2:2:n)));
ex5_12(@(x) 1 / sqrt(2 * pi) * exp(-x .^ 2 / 2), 0, 1, 50)

% Exercise 13: 使用 quadl 函数进行积分
fun = @(v) 5400 * v ./ (8.276 * v .^ 2 + 2000);
quadl(fun, 15, 30)

% Exercise 15: 求使 fun 最大的 p

% Exercise 16: 计算曲线下的面积
clear;
x = -3/4:0.01:3/4;
y = (3/4 + x) * 2 .* sqrt(1 - 16/9 * x .^ 2) * 9.8;
P = trapz(x, y) % 单位：千牛

% Exercise 17: 计算曲线下的面积
clear; close;
fplot(@(t) 17 - t .^(2/3) - 5 - 2 * t .^(2/3), [0, 20]);
grid;
t=0:0.1:8; y=17-t.^(2/3)-5-2*t.^(2/3);
trapz(t,y)-20 %单位：百万元
```
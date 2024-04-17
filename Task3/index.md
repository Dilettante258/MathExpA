---
layout: post
title: 任务3 编程与作图(课本第二章)
---

# 任务3 编程与作图(课本第二章)

## 1(课本习题2)

求满足$\sum_{n = 0}^{m}{\ln{(1 + n)}} > 100$的m最小值.

代码:

```matlab
s=log(1);n=0;
while s<=100
    n=n+1;
    s=s+log(1+n);
end
fprintf("最小m值是%d",n)
```

输出：

> 最小m值是37

## 2(课本习题6)

做出下列函数图像：

\(1)曲线$y = x^{2}\sin{(x^{2} - x - 2)}$, $- 2 \leq x \leq 2$
(分别使用plot和fplot完成)；

使用plot完成：

```matlab
x=-2:0.1:2;y=x.^2.*sin(x.^2-x-2);
plot(x,y)
```

使用fplot完成：

```matlab
f = @(x) x.^2 .* sin(x.^2 - x - 2);
fplot(f, [-2, 2])
```

绘图结果：

<img src="https://pic.wang1m.tech/uploads/2404/661e4ac92f5d9.png" alt="image-20240416175409393" style="zoom:80%;" />

\(2\) 椭圆$\frac{x^{2}}{4} + \frac{y^{2}}{9} = 1$;

代码和输出：

```matlab
r=-pi:0.1:pi;x=2*cos(r);y=3*sin(r);
plot(x,y)
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4affd5ea9.png" alt="image-20240416175511591" style="zoom:80%;" />

\(3\) 抛物面$z = x^{2} + y^{2}$, $\|x\| < 3,\ \|y\| < 3$;

代码和输出：

```matlab
xa=-3:0.1:3;ya=-3:0.1:3;
[x,y]=meshgrid(xa,ya);
z=x.^2+y.^2;
surf(x,y,z);
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b0d2e151.png" alt="image-20240416175524861" style="zoom:80%;" />

\(4\) 曲面$z = x^{4} + 3x^{2} + y^{2} - 2x - 2y - 2x^{2}y + 6$, $\|x\| < 3$, $- 3 < y < 13$;

代码和输出：

```matlab
xa=linspace(-3,3,100);ya=linspace(-3,13,100);
[x,y]=meshgrid(xa,ya);
z=x.^4+3*x.^2+y.^2-2*x-2*y-2*x.^2.*y+6;
surf(x,y,z);
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b197dbdd.png" alt="image-20240416175537235" style="zoom:80%;" />

\(5\) 空间曲线$x = \sin t,$ $y = \cos t$, $z = \cos{2t}$, $0 < t < 2\pi$;

代码和输出：

```matlab
t=linspace(0,2,50);
x=sin(t);y=cos(t);z=cos(2*t);
plot3(x,y,z)
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b2652439.png" alt="image-20240416175550081" style="zoom:80%;" />

\(6\)
半球面$x = 2\sin\phi\cos\theta,\ y = 2\sin\phi\sin\theta,\ z = 2\cos\phi$, $0 \leq \theta \leq 360^{o}$,$0 \leq \phi \leq 90^{o}$;

代码和输出：

```matlab
a=linspace(0,2*pi,50);b=linspace(0,pi/2,50);
[a,b]=meshgrid(a,b);
x=2*sin(a).*cos(b);y=2*sin(a).*sin(b);z=2*cos(a);
surf(x,y,z)
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b338bc20.png" alt="image-20240416175603288" style="zoom:80%;" />

\(7\)
三条曲线合成图$y_{1} = \sin x,\ y_{2} = \sin x\sin{10x},\ y_{3} = - \sin x$, $0 < x < \pi$.

代码和输出：

```matlab
x=linspace(0,pi,50);y1=sin(x);
plot(x,y1);
hold on;
y2=sin(x).*sin(10*x);
plot(x,y2);
y3=-sin(x);
plot(x,y3);
hold off;
```

![image-20240416175618749](https://pic.wang1m.tech/uploads/2404/661e4b43152cc.png)

## 3

设$f(x)=\left\{\begin{matrix}x^2,&x\geq2,\\\ x+2,&x<2,\end{matrix}\right.$求$f(2)$, $f( - 2)$.

代码：

```matlab
function y = g(x)
    if x >= 2
        y = x^2;
    else
        y = x + 2;
    end
end

g2 = g(2);
g_minus_2 = g(-2);

disp(['g(2) = ', num2str(g2)])
disp(['g(-2) = ', num2str(g_minus_2)])
```

结果：

> g(2) = 4
>
> g(-2) = 0

## 4

用循环语句计算10！

代码：

```matlab
sum = 1;
for i = 1:10
    sum = sum * i;
end
disp(sum)
```

输出：

> 3628800

5\. 使用两种方法求自然数1\~100之和(使用循环和不使用循环)。

使用循环：

```matlab
sum = 0;
for i = 1:100
    sum = sum + i;
end
disp(sum)
```

不使用循环：

```matlab
clear
sum = sum(1:100);
disp(sum)
```

结果：

> 5050

## 6

某种电子产品使用寿命t (2000)与产品等级s间的对应关系如下表，使用swith判断测试产品的等级。

| 使用寿命t/h | t>=1500 | 1200<=t<=1500 | 1000<=t<=1200 | t<1000 |
| ----------- | ------- | ------------- | ------------- | ------ |
| 产品等级s   | 一等品  | 二等品        | 三等品        | 不合格 |

代码：

```matlab
n = input('请输入该电子产品的使用寿命：');

if n < 0
    disp('输入非法！')
else
    switch n
        case num2cell(0:1000)
            disp('不合格')
        case num2cell(1000:1200)
            disp('三等品')
        case num2cell(1200:1500)
            disp('二等品')
        otherwise
            disp('一等品')
    end
end
```

输出：

> 请输入该电子产品的使用寿命：2000
>
> 一等品

## 7

判断下面语句的运算结果。

\(1\) 4 \< 20 (2) 4 \<= 20 (3) 4 == 20 (4) 4 \~= 20

答：(1)真;(2)真;(3)假;(4)真;

## 8

在MATLAB中使用一个循环确定：如果用户最初在一个银行帐户中存储\$10000，并且在每年的年终再存储\$10000(银行每年支付6%的利息)，那么账户上要积累\$1000000要需要多长时间。

代码：

```matlab
k=1;Sum=1000;
while Sum<1000000
    Sum=Sum*(1+0.06)+10000;
    k=k+1;
end
fprintf("需要%d年",k);
```

输出：

> 需要35年

## 9

用matlab创建一个结构体，用于统计学生的情况，包括学生的姓名、学号、各科成绩等。然后使用该结构体对一个班级的学生成绩进行管理，计算总分、平均分。假设学生人数为m=randi(\[30,
60\]).

代码：

```matlab
% 随机生成学生人数
m = randi([30, 60]);
% 创建班级
class = struct();

% 填充学生信息和成绩
for i = 1:m
    class(i).name = ['Student ' num2str(i)];
    class(i).id = i;
    class(i).grades = randi([30, 100], 1, 5);  % 假设每个学生有5门课程
end

for i = 1:m
    total_score = sum(class(i).grades);
    average_score = total_score/5;
    fprintf('学生 %s 的总分是 %d，平均分是 %.2f\n', class(i).name, total_score, average_score);
end
```

输出：

> 学生 Student 1 的总分是 371，平均分是 74.20
>
> 学生 Student 2 的总分是 303，平均分是 60.60
>
> ............
>
> 学生 Student 45 的总分是 254，平均分是 50.80
>
> 学生 Student 46 的总分是 421，平均分是 84.20

## 10

请编程计算$r = s^{2} + s^{4} + s^{6} + s^{8} + \cdots + s^{36} + s^{38}$,
s=0.5.

代码：

```matlab
s = 0.5;
r = 0;
for n = 2:2:38
    r = r + s^n;
end
r
```

输出：

> r = 0.3333

## 11

用曲面表示函数$z = x^{3} + y^{3}$

\(1\) 使用 ezsurf 函数画。 (2)不使用ezsurf 函数画。

**答：**

(1)代码：

```matlab
% 定义函数
f = @(x,y) x.^3 + y.^3;
% 使用ezsurf函数绘制图形
ezsurf(f, [-10 10 -10 10])
```

输出：

<img src="https://pic.wang1m.tech/uploads/2404/661e4b69b62ae.png" alt="image-20240416175657384" style="zoom:67%;" />

(2)代码：

```matlab
% 定义x和y的范围
x = -10:0.5:10; y = -10:0.5:10;
% 使用meshgrid函数生成网格点
[X,Y] = meshgrid(x, y);
% 计算每个网格点的z值
Z = X.^3 + Y.^3;
% 使用surf函数绘制图形
surf(X,Y,Z)
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b72a3d77.png" alt="image-20240416175706249" style="zoom:67%;" />

## 12

绘制$z = \frac{\cos x\sin y}{y}$的完整光滑曲面。其中，x$\in$\[-2π,2π\],y$\in$\[-2π,2π\]。(不能使用ezsurf，ezmesh)。

代码：

```matlab
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
```

<img src="https://pic.wang1m.tech/uploads/2404/661e4b83717e4.png" alt="image-20240416175723080" style="zoom:80%;" />

## 13

在 0≤x≤2π 区间内，分别用红色虚线和蓝色实线绘制曲线$y1=2e^{- 0.5x}$和y2=cos(4πx)，给图形加上图例"Y1","Y2",，在坐标为(0.8,1.5)处为y1 曲线加上文本说明"曲线 y1=2e\^{-0.5x})";在坐标为(2.5,1.1)处为曲线y2加上文本说明"曲线 y2=cos(4{\\pi}x))"; 对x、y轴加上标签"Variable X","Variable y".

代码：

```matlab
% 定义x的范围
x = linspace(0, 2*pi, 100);
% 计算y1和y2的值
y1 = 2*exp(-0.5*x);
y2 = cos(4*pi*x);

plot(x, y1, 'r--', 'DisplayName', 'Y1')
hold on
plot(x, y2, 'b-', 'DisplayName', 'Y2')

% 添加图例
legend
text(0.8, 1.5, '曲线 y1=2e^{-0.5x}')
text(2.5, 1.1, '曲线 y2=cos(4{\pi}x)')
xlabel('Variable X')
ylabel('Variable Y')

hold off
```

输出：

<img src="https://pic.wang1m.tech/uploads/2404/661e4b90d439d.png" alt="image-20240416175736310" style="zoom:80%;" />

## 14

在同一平面中的两个窗口分别画出心形线$\left\\{ \begin{array}{r}
x = a\left( 1 - \cos\theta \right)\cos\theta \\\
y = a\left( 1 - \cos\theta \right)\sin\theta
\end{array} \right.\ $和马鞍面$\frac{x^{2}}{a^{2}} - \frac{y^{2}}{b^{2}} = 2z$，其中，a取学号末尾数字，b取1到10之间的随机整数。

代码：

```matlab
theta = linspace(0, 2*pi, 1000); % 定义θ的范围
a = 3; % 取学号末尾数字
x = a * (1 - cos(theta)) .* cos(theta); % 计算x的值
y = a * (1 - cos(theta)) .* sin(theta); % 计算y的值

figure(1); % 创建新的图形窗口   
plot(x, y); % 在图形窗口中绘制心形线
title('心形线'); % 给图形添加标题

[x, y] = meshgrid(-2:0.1:2, -2:0.1:2); % 定义x和y的范围
b = randi([1, 10]); % 取1到10之间的随机整数
z = (x.^2/a^2 - y.^2/b^2)/2; % 计算z的值

figure(2); % 创建新的图形窗口
surf(x, y, z); % 在图形窗口中绘制马鞍面
title('马鞍面'); % 给图形添加标题
```

输出：
<div class="image-container">
    <img src="https://pic.wang1m.tech/uploads/2404/661e4b9d8b015.png" alt="image-20240416175749315" style="zoom: 67%;" />
    <img src="https://pic.wang1m.tech/uploads/2404/661e4ba7702fc.png" alt="image-20240416175759049" style="zoom: 67%;" />
</div>

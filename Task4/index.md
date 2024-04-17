---
layout: post
title: 任务4 符号计算(课本第七章)
---

# 任务4 符号计算(课本第七章)

## 1(课本习题2)

做因式分解$f(x) = x^{4} - 5x^{3} + 5x^{2} + 5x - 6$.

代码：

```matlab
syms x;
f = x^4-5*x^3+5*x^2+5*x-6;
factor(f)
```

输出：

> $(\begin{matrix} x - 1 & x - 2 & x - 3 & x + 1 \end{matrix})$

## 2(课本习题3)

求矩阵$A = \begin{pmatrix}1 & 2 \\\ 2 & a \end{pmatrix}$的逆和特征值.

代码：

```
syms a;
A = [1 2;2 a];
iA = inv(A)
e = eig(A)
```

答：

> 该矩阵的逆(iA)为$(\begin{matrix} \frac{a}{a - 4} & - \frac{2}{a - 4} \\\ \frac{2}{a - 4} & \frac{1}{a - 4} \end{matrix})$，
> 特征值(e)为$(\begin{array}{r} \frac{a}{2} - \frac{\sqrt{a^{2} - 2\, a + 17}}{2} + \frac{1}{2} \\\\ \frac{a}{2} + \frac{\sqrt{a^{2} - 2\, a + 17}}{2} + \frac{1}{2} \end{array})$。

### 3(课本习题4)

计算极限

$$
\lim_{x \rightarrow \infty}\left( 3^{x} + 9^{x} \right)^{\frac{1}{x}},\lim_{y \rightarrow 0^{+}}{\lim_{x \rightarrow 0^{+}}\frac{\ln{(2x + e^{- y})}}{\sqrt{x^{3} + y^{2}}}}，\\\ \lim_{x \rightarrow \infty}\frac{\ln{(1 + \frac{1}{x})}}{arccot \, x},\lim_{x \rightarrow 0}\frac{1 - \sqrt{1 - x^{2}}}{e^{x} - \cos x}
$$

代码：

```matlab
syms x y;
ans1 = limit((3^x+9^x)^(1/x),x,inf)
temp1 = limit(log(2*x+exp(-y))/(sqrt(x^3+y^2)-1),x,0);
ans2 = limit(s1,y,0)
ans3 = limit(log(1+1/x)/acot(x),x,inf)
ans4 = limit((1-sqrt(1-x^2))/(exp(x)-cos(x)),x,inf)
```

输出：

> ans1 = 9
>
> ans2 = 0
>
> ans3 = 1
>
> ans4 = 0

## 4(课本习题5)

计算

$$\sum_{k = 1}^{n}k^{2},\ \sum_{k = 1}^{\infty}\frac{1}{k^{2}},\ \sum_{n = 0}^{\infty}\frac{1}{(2n + 1)(2x + 1)^{2n + 1}}.$$

代码：

```matlab
syms k n x;
s1=symsum(k^2,k,1,n);
s2=symsum(k^(-2),k,1,inf);
s3=symsum(1/(2*n+1)/(2*x+1)^(2*n+1),n,0,inf);
s1=simplify(s1)
s2=simplify(s2)
s3=simplify(s3)
```

输出：

> s1 = $\frac{n\,(2\, n + 1)\,(n + 1)}{6}$
>
> s2 = $\frac{\pi^{2}}{6}$
>
> s3 = $atanh(\frac{1}{2x + 1}) \text{ if  }1 < \|2x + 1\|$

## 5(课本习题6)

求$\left. \ \frac{\partial^{3}}{\partial x^{2}\partial y}\sin\left( x^{2}y z \right) \right\|_{x = 1,y = 1,z = 3}$.

代码：

```matlab
syms x y z;
s=sin(x^2*y*z);
s=diff(s,x,2);
s=diff(s,y,1);
s=subs(s,{x,y,z},{1,1,3})
```

输出：

> s = $log(x + \sqrt{x^{2} + 1})$

## 6(课本习题7)

(Taylor展开)求下列函数在$x = 0$的Taylor幂级数展开式(n=8):

$$e^{x}, \ln{(1 + x)}, \sin x,$$
$$\ln{(x + \sqrt{1 + x^{2}})}, \frac{1}{x^{2} - 3x + 2}.$$

输出：

```matlab
syms x
f1 = exp(x);
f2 = log(1+x);
f3 = sin(x);
f4 = log(x+sqrt(1+x^2));
f5 = 1/(x^2-3*x+2);
f = [f1 f2 f3 f4 f5];
for i=1:length(f)
    taylor(f(i), x, 'Order', 9, 'ExpansionPoint', 0)
end
```

输出：

> ans =
> $\frac{x^{8}}{40320} + \frac{x^{7}}{5040} + \frac{x^{6}}{720} + \frac{x^{5}}{120} + \frac{x^{4}}{24} + \frac{x^{3}}{6} + \frac{x^{2}}{2} + x + 1$
>
> ans =
> $- \frac{x^{8}}{8} + \frac{x^{7}}{7} - \frac{x^{6}}{6} + \frac{x^{5}}{5} - \frac{x^{4}}{4} + \frac{x^{3}}{3} - \frac{x^{2}}{2} + x$
>
> ans = $- \frac{x^{7}}{5040} + \frac{x^{5}}{120} - \frac{x^{3}}{6} + x$
>
> ans =
> $- \frac{5\, x^{7}}{112} + \frac{3\, x^{5}}{40} - \frac{x^{3}}{6} + x$
>
> ans =
> $\frac{511\, x^{8}}{512} + \frac{255\, x^{7}}{256} + \frac{127\, x^{6}}{128} + \frac{63\, x^{5}}{64} + \frac{31\, x^{4}}{32} + \frac{15\, x^{3}}{16} + \frac{7\, x^{2}}{8} + \frac{3\, x}{4} + \frac{1}{2}$

## 7(课本习题9)

计算下列不定积分并用diff验证:

$\int_{}^{}{e^{2x}\left( \tan x + 1 \right)^{2}}dx,\int_{}^{}\frac{e^{2y}}{e^{y} + 2}dy,\ \int_{}^{}\frac{x^{2}}{\sqrt{a^{2} - x^{2}}}dx,\ $

$\int_{}^{}e^{x^{- 2}}dx,\ \ \int_{}^{}\frac{dx}{x(\sqrt{\ln x + a} + \sqrt{\ln x + b})}\ (a \neq b).\ $

代码：

```matlab

function intf(f,symbol)
    fi = int(f,symbol)
    s = simplify(diff(fi));
    if (f / s == 1)
        fprintf('经验证，运算结果正确。')
    end
end


% 7.1
syms x;
f1 = exp(2*x)*(tan(x)+1)^2;
intf(f1,x);

% 7.2
syms y;
f2 = exp(2*y)/(exp(y)+2);
intf(f2,y)


% 7.3
syms x a;
f3 = x^2/sqrt(a^2-x^2);
intf(f3,x)

% 7.4
syms x;
f4 = exp(x^(-2));
intf(f4,x)

% 7.5
syms x;
syms a b;
assume(a ~= b);
f5 = 1/x/(sqrt(log(x)+a)+sqrt(log(x)+b));
intf(f5,x)
```

输出：

> fi = $e^{2\, x}\,\tan(x)$\
> 经验证，运算结果正确。
>
> fi = $e^{y} - 2\,\log(e^{y} + 2)$
>
> fi =
> $\frac{a^{2}\, atan(\frac{x}{\sqrt{a^{2} - x^{2}}})}{2} - \frac{x\,\sqrt{a^{2} - x^{2}}}{2}$
>
> 经验证，运算结果正确。
>
> fi = $\frac{x\,\text{expint}(\frac{3}{2}, - \frac{1}{x^{2}})}{2}$
>
> fi =
> $\sqrt{a + \log(x)}\,\left( \frac{2\, a}{3\, a - 3\, b} + \frac{2\,\log(x)}{3\, a - 3\, b} \right) - \sqrt{b + \log(x)}\,\left( \frac{2\, b}{3\, a - 3\, b} + \frac{2\,\log(x)}{3\, a - 3\, b} \right)$

## 8(课本习题10)

计算积分$I(x) = \int_{- x}^{x}{(x - y)^{3}\sin{(x + 2y)}}dy$.

代码：

```matlab
syms x y;
f=(x-y)^3*sin(x+2*y);
Ix=simplify(int(f,y,-x,x))
```

输出：

> Ix =
> $4\, x^{3}\, cos(x) - 3\, x^{2}\, sin(x) + \frac{3\,{cos(x)}^{2}\, sin(x)}{2} - \frac{3\, x\, cos(x)}{2}$

## 9(课本习题12)

用solve和vpasolve求解：

(1) $x^{2} + x + 1$; 

(2) $3x^{5} - 4x^{3} + 2x - 1$; 

(3)$5x^{23} - 6x^{7} + 8x^{6} - 5x^{2}$;

(4) $\left\\{ \begin{array}{r}a = 0.7\sin a + 0.2\cos b \\\\b = 0.7\cos a - 0.2\sin b\end{array} \right.\ $

代码：

```matlab
syms x;
f1 = x^2+x+1;
f2 = 3*x^5-4*x^3+2*x-1;
f3 = 5*x^23-6*x^7+8*x^6-5*x^2;
syms a b;
f4_1 = a-0.7*sin(a)-0.2*cos(b);
f4_2 = b-0.7*cos(a)+0.2*sin(b);

ans1 = solve(f1)
ans1_vpa = vpasolve(f1)
ans2 = solve(f2)
ans2_vpa = vpasolve(f2)
ans3 = solve(f3)
ans3_vpa = vpasolve(f3)
ans4=solve(f4_1,f4_2);
a = ans4.a, b = ans4.b
ans4_vpa = vpasolve([f4_1,f4_2],[a,b]);
a = ans4_vpa.a, b = ans4_vpa.b
```

输出：

> ans1 =
>
> \- (3\^(1/2)\*1i)/2 - 1/2
>
> (3\^(1/2)\*1i)/2 - 1/2
>
> ans1_vpa =
>
> \- 0.5 - 0.86602540378443864676372317075294i
>
> \- 0.5 + 0.86602540378443864676372317075294i
>
> ans2 =
>
> 1
>
> root(z\^4 + z\^3 - z\^2/3 - z/3 + 1/3, z, 1)
>
> root(z\^4 + z\^3 - z\^2/3 - z/3 + 1/3, z, 2)
>
> root(z\^4 + z\^3 - z\^2/3 - z/3 + 1/3, z, 3)
>
> root(z\^4 + z\^3 - z\^2/3 - z/3 + 1/3, z, 4)
>
> ans2_vpa =
>
> 1.0
>
> \- 0.94789546187456058989982247394741 +
> 0.38447007122004299382156325898354i
>
> ......
>
> b =
>
> 0.50791971903684924497183722688768
>

## 10(课本习题13)

用dsolve求解：

\(1\) $y^{'} = x + y,\ y(0) = 1$

\(2\) $- x^{'} = 2x + 3y,\ y^{'} = 2x + y,\ x(0) = - 2.7,\ y(0) = 2.8$

\(3\) $y^{''} - 0.01y^{'2} + 2y = \sin t,\ y(0) = 1,\ y^{'}(0) = 0$

\(4\) $2x^{''}(t) - 5x^{'}(t) - 3x(t) = 90e^{2t},\ x(0) = 2,\ x^{'}(0) = 1$

\(5\) $x^{''} = - \frac{2x^{'}}{t} + \frac{2x}{t^{2}} + \frac{10\cos{\ln t}}{t^{2}},\ x(1) = 1,\ x(3) = 3.$

代码：

```matlab
% 10.1
syms y(x)
Dy = diff(y);
eqn = Dy == x + y;
cond = y(0) == 1;
S = dsolve(eqn, cond)

% 10.2
syms x(t) y(t)
eqn1 = diff(x, t) == -2*x - 3*y;
eqn2 = diff(y, t) == 2*x + y;
eqns = [eqn1, eqn2];
cond1 = x(0) == -2.7;
cond2 = y(0) == 2.8;
conds = [cond1, cond2];
S = dsolve(eqns, conds);
Sx = S.x, Sy = S.y

% 10.3 (解不出)
syms y(t)
eqn = diff(y, t, t) - 0.01*(diff(y, t))^2 + 2*y == sin(t);
cond1 = y(0) == 1;
Dy = diff(y);
cond2 = Dy(0) == 0;
conds = [cond1, cond2];
S = dsolve(eqn, conds)

% 10.4
syms x(t)
eqn = 2*diff(x, t, t) - 5*diff(x, t) - 3*x == 90*exp(2*t);
cond1 = x(0) == 2;
Dx = diff(x);
cond2 = Dx(0) == 1;
conds = [cond1, cond2];
S = dsolve(eqn, conds)

% 10.5
syms x(t)
eqn = diff(x, t, t) == -(2*diff(x, t))/t + 2*x/t^2 + (10*cos(log(t)))/t^2;
cond1 = x(1) == 1;
cond2 = x(3) == 3;
conds = [cond1, cond2];
S = dsolve(eqn, conds)
```

输出：

> S = $2\, e^{x} - x - 1$
>
> Sx =
>
> $\begin{array}{r}
> \frac{4\,\sqrt{15}\,\left( \frac{3\, e^{- \frac{t}{2}}\,\sigma_{1}}{4} - \frac{\sqrt{15}\, e^{- \frac{t}{2}}\,\sigma_{2}}{4} \right)}{25} - \frac{21\, e^{- \frac{t}{2}}\,\sigma_{2}}{10} - \frac{7\,\sqrt{15}\, e^{- \frac{t}{2}}\,\sigma_{1}}{10} \\\
>  \\\
> where \\\
>  \\\
> \ \sigma_{1} = \sin\left( \frac{\sqrt{15}\, t}{2} \right) \\\
>  \\\
> \ \sigma_{2} = \cos\left( \frac{\sqrt{15}\, t}{2} \right)
> \end{array}$
>
> Sy =
> $\frac{14\, e^{- \frac{t}{2}}\,\cos(\frac{\sqrt{15}\, t}{2})}{5} - \frac{4\,\sqrt{15}\, e^{- \frac{t}{2}}\,\sin(\frac{\sqrt{15}\, t}{2})}{25}$
>
> 警告: Unable to find symbolic solution.
>
> S = \[ empty sym \]
>
> S =
> $\frac{2\, e^{- \frac{t}{2}}\,\left( 47\, e^{\frac{7\, t}{2}} - 63\, e^{\frac{5\, t}{2}} + 23 \right)}{7}$
>
> S = $\begin{array}{r}
> \frac{\frac{t^{3}\,\left( \frac{27\,\sqrt{10}\,\sigma_{1}}{26} + \frac{69}{26} \right)}{3} - \sqrt{10}\, t^{2}\,\cos(atan(\frac{1}{3}) + \log(t))}{t^{2}} - \frac{\frac{9\,\sqrt{10}\,\sigma_{1}}{26} - \frac{81}{26}}{t^{2}} \\\
>  \\\
> where \\\
>  \\\
> \ \sigma_{1} = \cos(atan(\frac{1}{3}) + \log(3))
> \end{array}$

## 11

计算导数：$y = \frac{1 + \sin x}{1 - \cos x}$, $y = \begin{bmatrix}
\arcsin x & \arccos x \\\
\arctan x & arccot \, x
\end{bmatrix}$.

代码：

```matlab
% 对于函数 y = (1 + sin(x))/(1 - cos(x))
syms x;
y1 = (1 + sin(x))/(1 - cos(x));
y_prime_1 = diff(y1, x)

% 对于向量函数 y = [arcsin(x), arccos(x), arctan(x), arccot(x)]
y2 = [asin(x), acos(x); atan(x), acot(x)];
y_prime_2 = diff(y2, x)
```

输出：

> y_prime_1 = $- \frac{\cos(x)}{\cos(x) - 1} - \frac{\sin(x)\,\left( \sin(x) + 1 \right)}{\left( \cos(x) - 1 \right)^{2}}$
>
> y_prime_2 = $(\begin{matrix} \frac{1}{\sqrt{1 - x^{2}}} & - \frac{1}{\sqrt{1 - x^{2}}} \\\ \frac{1}{x^{2} + 1} & - \frac{1}{x^{2} + 1}\end{matrix})$

## 12

计算下列定积分：

$$\int_{0}^{\frac{\pi}{4}}\frac{x}{1 + \cos{2x}}dx,\ \int_{0}^{1}{x\left( 1 - x^{4} \right)^{\frac{3}{2}}}dx$$

代码：

```matlab
syms x;
f1 = x / (1 + cos(2*x));
int(f1, 0, pi/4)

f2 = x * (1 - x^4)^(3/2);
int(f2, 0, 1)
```

输出：

> ans = $\frac{\pi}{8} - \frac{\log(2)}{4}$
>
> ans = $\frac{3\,\pi}{32}$
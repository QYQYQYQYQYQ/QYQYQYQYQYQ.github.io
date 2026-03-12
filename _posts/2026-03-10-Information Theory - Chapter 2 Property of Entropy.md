---
title: "Information Theory - Chapter 2 Property of Entropy"
date: 2026-03-10
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---

In this chapter, we will further discover the properties of Entropy. 


<!--more-->

**Theorem(Jensen's inequality)**: If function $f$ is convex and $X$ is a discrete random variable. It takes values on $\mathcal{X}(x_1, x_2, \cdots, x_n), P_X=(p_1, \cdots, p_n)$. Then

$$ 
\sum_{i=1}^n p_if(x_i)\ge f(\sum_{i=1}^np_ix_i).
$$

This could also be written as

$$
\mathbb{E}[f(X)]\ge f(\mathbb{E}[X]).
$$

If $f$ is strictly convex, and if equality holds, then $X=\mathbb{E}[X]$.

**Theorem**: $P(x), Q(x)$ are distribution on $\mathcal{X}$, for $x\in \mathcal{X}$. So $D(P\Vert Q)\ge 0$ with equality iff $P(x)=Q(x), \forall x\in \mathcal{X}.$

**Proof**: Let 

$$
	A=\{x:P(x)>0\},
$$

we may assume $Q(x)>0, x\in A$. (else if $Q(x)=0$ for some $x\in A$ then $D=\infty$)

Then, 

$$
\begin{aligned}
-D(P\Vert Q)&=\sum_{x\in A}P(x)\log\frac{P(x)}{Q(x)}\\
&=\sum_{x\in A}P(x)\log\frac{Q(x)}{P(x)}\\
&\le \log \sum_{x\in A} P(x) \frac{Q(x)}{P(x)}\\
&=\log\sum_{x\in X}Q(x)\\
&=0
\end{aligned}
$$

Since $f(x)=\log(x)$ is concave $\Rightarrow$equality holds iff $\frac{Q(x)}{P(x)}=C, \forall x\in \mathcal{X}$. As 

$$
1=\sum_{x\in \mathcal{X}} Q(x)=C\sum_{x\in \mathcal{X}} P(x)=C \Rightarrow P(x)=Q(x).∎
$$

**Corollary**: $I(X;Y\ge 0)$ with equality iff $X$ and $Y$ are independent.

**Proof**: 

$$
\begin{aligned}
I(X;Y)=D(P_{X, Y}\Vert P_XP_Y)∎
\end{aligned}
$$

**Corollary**: $D(P_{Y\vert X}\Vert Q_{Y\vert X})\ge 0$ with equality iff $P_{Y\vert X}(y\vert x)=Q_{Y\vert X}(y\vert x)$ for all $(y, x)\in Y\times X$ s.t. $P_X(x)>0$.

**Corollary**: $I(X, Y\vert Z)\ge 0$ with equality iff $P_{XY\vert Z}(xy\vert z)=P_{X\vert Z}(x\vert z)P_{Y\vert Z}(y\vert z).$

**Theorem**: $H(X)\le \log \vert X\vert $ with equality iff $X$ is uniformly distribution over $X$.

**Proof**: 
Let $U(x)=\frac{1}{\vert X\vert }$ for $x\in X$.

$$
\begin{aligned}
D(P_X\Vert U)&=\sum_{x\in X} P(x)\log\frac{P_X(x)}{U(x)}\\
&=\log \vert X\vert -H(X)\ge 0∎
\end{aligned}
$$

**Theorem**: $H(X\vert Y)\le H(X)$.

**Proof**: $H(X)-H(X\vert Y)=I(X;Y)\ge 0.∎$

However, note that condition on an specific event may/maynot decrease entropy:

$$
H(X\vert Y=y)\ ?\ H(X)
$$

**Theorem(Independent bound)**: $H(X_1, \cdots, X_n)\le \sum_{i=1}^nH(X_i)$ with equality iff $X_1, \cdots, X_n$ are independent.

Han's inequality:

$$
\begin{aligned}
H(X_1, X_2, \cdots, X_n)\le \frac{1}{n-1}\sum_{i=1}^nH(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n).\\
\forall i, H(X_1, X_2, \cdots, X_n)=H(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n)\\
+H(X_i\vert X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n)
\end{aligned}
$$

So 

$$
\begin{aligned}
\sum_{i=1}^nH(X_1, X_2, \cdots, X_n)&=\sum_{i=1}^n H(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n) \\
&+ \sum_{i=1}^n H(X_i\vert X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n) \\
&\le \sum_{i=1}^nH(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n) \\
& + \sum_{i=1}^nH(X_i\vert X_1, \cdots, X_{i-1}) \\
&= \sum_{i=1}^nH(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n) + H(X_1,\cdots, X_n) \\
\Rightarrow & (n-1)H(X_1, \cdots, X_n)\le \sum_{i=1}^nH(X_1, \cdots, X_{i-1}, X_{i+1}, \cdots, X_n).∎
\end{aligned}
$$

We could demonstrate the Han's inequality by another method. 

**Definition(Submodular functions)**: Let

$$
S=\{1, 2, \cdots, n\}, f:2^S\rightarrow \mathbb{R}.
$$

The function $f$ is called submodular if 

$$
\forall T_1, T_2\subset S, f(T_1\cup T_2)+f(T_1\cap T_2)\le f(T_1)+f(T_2).
$$

This definition is equivalant to: if $\forall T_1\subset T_2\subset S, b\in S-T_2$, 

$$
f(T_2\cup\{b\})-f(T_2)\le f(T_1\cup \{b\}-f(T_1)),
$$

which means adding elements brings dimishing marginal return.

**Theorem**: Let discreterandom variable

$$
X=\{x_1, \cdots, x_n\} %\text{ with } P_X=
$$

Let 

$$
T\subset\{1, \cdots n\},
$$

then the function $T\rightarrow H(X_T)$ is submodular.

So with this theorem, we could demonstrate Han's inequality more conveniently. 

Denote

$$
\begin{aligned}
T_1=\{1, \cdots, i-1\}, T_2=\{1, \cdots, i-1, i+1, \cdots, n\}, b=i.
\end{aligned}
$$

Using equivalent definition, 

$$
\begin{aligned}
& H(X_{T_2\cup\{i\}})-H(X_{T_2}) \le H(X_{T_1\cup \{i\}})-H(X_{T_1})\\
\end{aligned}
$$

$$
\begin{aligned}
\Rightarrow H(X_1, \cdots, X_n) - H(X_1,\cdots, X_{i-1}, X_{i+1}, X_n) &\le H(X_1, \cdots, X_i)-H(X_1, \cdots, X_{i-1})\\
&=H(X_i\vert X_1, \cdots, X_{i-1})
\end{aligned}
$$

Summing over $i=1, 2, \cdots, n$, we obtain Han's inequality.

**Theorem(Log-sum inequality)**: Let $a_i\ge 0, b_i\ge 0, i=1, 2, \cdots, n.$ Let $a=\sum_{i=1}^n a_i, b=\sum_{i=1}^n b_i$,

$$
\sum_{i=1}^n a_i\log\frac{a_i}{b_i}\ge a\log\frac{a}{b}.
$$

**Proof**:

$$
\begin{aligned}
\sum_{i=1}^n a_i \log \frac{a_i}{b_i} &= \sum_{i=1}^n b_i \frac{a_i}{b_i}\log\frac{a_i}{b_i}\\
&=b\sum_{i=1}^n \frac{b_i}{b} \frac{a_i}{b_i} \log\frac{a_i}{b_i}\\
&\ge b(\sum_{i=1}^n \frac{b_i}{b}\frac{a_i}{b_i})\log(\sum_{i=1}^n\frac{b_i}{b}\frac{a_i}{b_i})\\
&=b \frac{a}{b}\log\frac{a}{b}\\
&=a\log\frac{a}{b}. ∎
\end{aligned}
$$

**Theorem(Convexity of $D$)**: Let $P(X), Q(X)$ be PMFs, then $D(P\Vert Q)$ is convex in $(P, Q)$, i.e., $D(\lambda P_1+(1-\lambda)P_2\Vert \lambda Q_1+(1-\lambda)Q_2)\le \lambda D(P_1\Vert Q_1) + (1-\lambda) D(P_2\Vert Q_2)$.

**Proof**: Apply log-sum inequality termwise. Fix $x\in X$,

$$
(\lambda P_1(x)+(1-\lambda)P_2(x))\log\frac{\lambda P_1(x)+(1-\lambda)P_2(x)}{\lambda Q_1+(1-\lambda)Q_2}\le \lambda P_1\log\frac{P_1(x)}{Q_1(x)}+(1-\lambda) P_2(x)\log\frac{P_2(x)}{Q_2(x)}
$$

Summing over the $x\in X$, we will obtain the desired results. ∎

**Theorem(Convexity of $H$**):$H(P)$ is a concave function of $P$.

**Proof**: 

$$
H(P)=\log\vert X\vert -D(P\Vert U)
$$

Note that $D(P\Vert U)=\sum_{x\in X}P(x)\log\frac{P(x)}{\vert X\vert }.$ ∎

**Theorem:** Given RVs $X, Y$ with joint PMF $P_{XY}$,

(1). $I(X; Y)$ is concave in $P_X$ for a fixed $P_{Y\vert X}$.

(2). $I(X;Y)$ is convex in $P_{Y\vert X}$ for a fixed $P_X$.

**Proof**:

(1). Note that

$$
I(X, Y)=H(Y)-\sum_{x\in X} P_X(x)H(Y\vert X=x).
$$

As 

$$
P_Y(y)=\sum_{x\in X} P_X(x)P_{Y\vert X}(y\vert x),
$$

which means $P_Y$ is linear in $P_X$.

Accordingly, $H(Y)$ is concave in $P_X$, so is $I(X;Y)$ when $P_{Y_X}$ is fixed.

(2). Fix $P_X$.

Let $P_1(y\vert x), P_2(y\vert x)$ be two possibility for $P_{Y\vert X}$.

Denote $P_i(x, y)=P_X(x)P_i(y\vert x), P_i(y)=\sum_{x\in X}P_i(x, y)$.

Choose $\lambda\in [0,1)$ and consider the mixtures:

$$
P_\lambda(y\vert x)=\lambda P_1(y\vert x)+(1-\lambda)P_2(y\vert x).
$$

So 

$$
\begin{aligned}
P_\lambda(x, y)&=P_X(x)P_\lambda(y\vert x)=\lambda P_1(y\vert x)P_X(x)+(1-\lambda)P_2(y\vert x) P_X(x) \\
P_\lambda(y)&=\sum_{x\in X} P_\lambda(x, y)=\lambda P_1(y) + (1-\lambda) P_2(y).
\end{aligned}
$$

Let $Q_\lambda(x, y)=P_X(x)P_\lambda(y)=\lambda P_1(y)P_X(x)+(1-\lambda)P_2(y)P_X(x)=\lambda Q_1(x,y)+(1-\lambda)Q_2(x, y)$.

So, with convexity of $D$,

$$
D(P_\lambda(x,y)\Vert Q_\lambda(x, y))\le \lambda D(P_1(x, y)\Vert P_X(x)P_1(y))+(1-\lambda)D(P_2(x, y)\Vert P_X(x)P_2(y)).
$$
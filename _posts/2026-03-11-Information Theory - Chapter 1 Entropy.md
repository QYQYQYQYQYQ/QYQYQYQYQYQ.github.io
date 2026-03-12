---
title: "Information Theory - Chapter 1: Entropy"
date: 2026-03-11
categories: [学术, 信息论]
tags: [信息论, 熵]
mathjax: true
---


This chapter introduce the definition of entropy, joint entropy, conditional entropy, relative entropy(divergence), conditional divergence, mutual information and conditional mutual information.

<!--more-->

**Entropy:** 

$$
\begin{aligned}
H(X)  &=\mathbb{E}[\log\frac{1}{P_X(x)}] \\
      &=-\sum_{x\in X}P_X(x)\log P_X(x)
\end{aligned}
$$




**Joint Entropy:**

$$
\begin{aligned}
H(X, Y)&=\mathbb{E}_{XY}[\frac{1}{\log P_{XY}(x, y)}]\\
       &=\sum_{x\in X}\sum_{y\in Y}P_{XY}(x, y)\log P_{XY}(x, y)
\end{aligned}
$$

**Conditional Entropy:**

$$
\begin{aligned}
H(X|Y=y)&=\sum_{x\in X}P_{X|Y}(x|y)\log \frac{1}{P_{X|Y}(x|y)}\\
&=\mathbb{E}_{X|Y=y}(\frac{1}{\log P_{X|Y=y}(x|y)})
\end{aligned}
$$

So,

$$
\begin{aligned}
H(X|Y)&=\sum_{y\in Y}H(X|Y=y)P_Y(y)\\
&=\sum_{y\in Y}\sum_{x\in X}P_{X|Y}(x|y)P_Y(y)\log \frac{1}{P_{X|Y}(x|y)} \\
&=\sum_{y\in Y}\sum_{x\in X}P_{XY}(x,y)\log \frac{1}{P_{X|Y}(x|y)} \\
&=\mathbb{E}_{XY}\log\frac{1}{P_{X|Y}(x|y)}
\end{aligned}
$$

**Relation between Joint Entropy and Conditional Entropy:** 

$$
\begin{aligned}
H(X,Y)=H(X)+H(Y|X)=H(Y)+H(X|Y)
\end{aligned}
$$

**Chain Rule of Entropy:** 

$$
\begin{aligned}
H(X_1, X_2, \cdots, X_n)&=H(X_1) + H(X_2, X_3, \cdots, X_n|X_1)\\
&=H(X_1) + H(X_2|X_1) + H(X_3, \cdots, X_n|X_1, X_2)\\
&=\sum_{i=1}^nH(X_i|X_1, \cdots, X_{i-1})
\end{aligned}
$$

**Relative Entropy (KL-Divergence)**: Distance between probably distribution, for $P$ and $Q$ on $X$, 

$$
\begin{aligned}
D(P\Vert Q)&=\sum_{x\in X}P_X(x)\log \frac{P_X(x)}{Q_X(x)}\\
&=\mathbb{E}_P\log\frac{P_X(X)}{Q_X(X)}
\end{aligned}
$$

Note that $D(P\Vert Q)\neq D(Q\Vert P)$.

**Conditional Divergence**:

$$
\begin{aligned}
D(P_{Y|X};Q_{Y|X})&=\sum_{x, y} P_{XY}(x, y) \log\frac{P_{Y|X}(y|x)}{Q_{Y|X}(y|x)} \\
&=\mathbb{E}_{XY}\log \frac{P_{Y|X}(y|x)}{Q_{Y|X}(y|x)}
\end{aligned}
$$

**Chain Rule of Divergence**:

$$
D(P_{XY};Q_{XY})=D(P_X\Vert Q_X) + D(P_{Y|X}\Vert Q_{Y|X})
$$

**Mutual Information**:

$$
\begin{aligned}
I(X;Y)&=D(P_{XY}\Vert P_XP_Y)\\
&=\mathbb{E}_{XY}\log \frac{P_{XY}}{P_XP_Y}\\
&=H(X) + H(Y)-H(X,Y)\\
&=H(X) - H(X|Y)=H(Y) - H(Y|X)
\end{aligned}
$$

Note that $I(X;Y)=I(Y;X), I(X;X)=H(X)$


**Conditional Mutual Information**:

$$
\begin{aligned}
I(X;Y|Z)&=H(X|Z)-H(X|Y, Z) \\
&=\mathbb{E}_{XYZ}\log\frac{P_{XY|Z}(xy|z)}{P_{X|Z}(x|z)P(Y|Z)(y|z)}
\end{aligned}
$$

**Chain Rule of Mutual Information**:

$$
\begin{aligned}
I(X_1, X_2, \cdots, X_n;Y)&=H(X_1, X_2, \cdots, X_n)-H(X_1, X_2, \cdots, X_n|Y)\\
&=\sum_{i=1}^n[H(X_i|X_1, \cdots, X_{i-1}) - H(X_i|X_1, \cdots, X_{i-1}, Y)]\\
&=\sum_{i=1}^nI(x_i;Y|X_1, X_2, \cdots, X_{i-1})
\end{aligned}
$$
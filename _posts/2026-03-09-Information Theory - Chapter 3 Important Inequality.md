---
title: "Information Theory - Chapter 3 Important Inequality"
date: 2026-03-09
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---

In this section, we will introduce some important inequalities (data processing inequality and fano's inequality).

## Data Processing Inequality

Let $X\rightarrow Y\rightarrow Z$ form a Markov chain if $P_{XYZ}(x,y,z)=P_X(x)P_{Y\vert X}(y\vert x)P_{Z\vert Y}(z\vert y)$.

Equivalently, $Z$ and $X$ are conditional independent given $Y$.

**Theorem 1(Data processing inequality):** If $X\rightarrow Y\rightarrow Z$, then $I(X;Y)\ge I(X, Z)$. Equality holds if and only if $I(X;Y\vert Z)=0$.

**Proof:** 

$I(X;Y,Z)=I(X;Z)+I(X;Y\vert Z)=I(X;Y)+I(X;Z\vert Y)=I(X;Y)$

$I(X;Y\vert Z)\ge 0,I(X;Z\vert Y)=0\Rightarrow I(X;Z)\le I(X;Y)$.

## Fano's Inequality

Given RV $Y$, estimate RV $X$ with $H(X\vert Y)>0$. For $X\sim P_X(x),x\in\mathcal{X}$. Observe $Y$, which is related $X$ by $P_{Y\vert X}(y\vert x)$. And then compute $\hat{X}=g(Y)$ where $g:\mathcal{Y}\rightarrow \hat{\mathcal{X}}$. The goal is to bound the error probability $P_e\triangleq Pr(X\neq g(Y))$.

**Theorem(Fano's inequality):** For any estimate $\hat X$ such that $X\rightarrow Y\rightarrow \hat{X}$, the error probability $P_e$ satisfies that

$$
h(P_e)+P_e\log\vert\mathcal{X}\vert\ge H(X\vert\hat X)\ge H(X\vert Y).
$$

And another weaker version is

$$
1+P_e\log\vert\mathcal{X}\vert\ge H(X\vert Y) \Leftrightarrow P_e\ge \frac{H(X\vert Y)-1}{\log\vert\mathcal{X}\vert}
$$

**Proof:** 

For $H(X\vert\hat X)\ge H(X\vert Y)$, just need to observe $I(X;\hat X)=H(X)-H(X\vert \hat X)\le I(X;Y)=H(X)-H(X\vert Y)$.

Let $E=\textbf{1}(\hat X\neq X)$ be the RV.

$H(E,X\vert \hat X)=H(X\vert \hat X)+H(E\vert \hat X,X)=H(E\vert \hat X)+H(X\vert E,\hat X)$.

With $H(E\vert \hat X,X)=0,H(E\vert \hat X)\le H(E)=h(P_e),$

$$
\begin{aligned}
H(X\vert E,\hat X)&=P(E=0)H(X\vert E=0,\hat X)+P(E=1)H(X\vert E=1,\hat X)\\
&=P(E=1)H(X\vert E=1,\hat X)=P(E=1)H(X\vert X\neq\hat X)\le P_e\log\vert \mathcal{X}\vert.
\end{aligned}
$$

$\Rightarrow H(E,X\vert\hat X)=H(X\vert\hat X)\le h(P_e)+P_e\log\vert \mathcal{X}\vert$

$\Rightarrow H(X\vert \hat X)\le h(P_e)+P_e\log\vert \mathcal{X}\vert$.

**Corollary 1:** For any RVs $X$ and $Y$, let $p=P(Y\neq X)$. Take $\hat X=Y$, then $H(X\vert Y)\le h(p)+p\log\vert\mathcal{X}\vert$.

**Corollary 2:** Assume $\hat X=X$, i.e., $g:\mathcal{Y}\rightarrow \mathcal{X}$, then $H(X\vert Y)\le h(p)+p\log(\vert \mathcal{X}\vert-1)$.

**Remark:** Fano's inequality is sharp.(i.e. the equality can be achieved). 

**Lemma 1:** Let $X,X^\prime$ be i.i.d with $H(X)$. Then $Pr(X=X^\prime)\ge 2^{-H(X)}$.

**Proof:** 

Let $X\sim P_X(x), 2^{-H(X)}=2^{\mathbb{E}\log P_X(x)}\le \mathbb{E}2^{\log P_X(x)}=\mathbb{E}P_X(x)=\sum_{x\in\mathcal{X}}P_X(x)=Pr(X=X^\prime)$.

For equality, when $\log P_X(x)$ is constant $\Leftrightarrow P_X(x)=2^{\text{constant}}$.

**Corollary 3:** Let $X$ be independent with $X^\prime;P_X(x)=P(x),x\in\mathcal{X};P_{X^\prime}(x)=Q(x),x\in\mathcal{X}$. Then $Pr(X=X^\prime)\ge \max(2^{-H(P)-D(P\Vert Q)},2^{-H(Q)-D(Q\Vert P)})$.

**Proof:** 

$$
\begin{aligned}
2^{-H(P)-D(P\Vert Q)}&=2^{\mathbb{E}_X\log P(x)-\mathbb{E}_X\log\frac{P(x)}{Q(x)}}=2^{\mathbb{E}_X\log(Q(x))}\le\mathbb{E}_X2^{\log Q(X)}\\
&=\mathbb{E}_XQ(x)=\sum_{x\in\mathcal{X}}P(x)Q(x)=Pr(X=X^\prime).
\end{aligned}
$$
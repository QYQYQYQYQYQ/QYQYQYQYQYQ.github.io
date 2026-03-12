---
title: "Information Theory - Chapter 4 Asympotic Equipartition Property(AEP)"
date: 2026-03-08
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---


Informal statement of AEP: Let $X_1,\cdots,X_n$ be i.i.d. Then almost all realizations $(x_1, \cdots,x_n)$ have probability close to $2^{-nH(X)}$. The set of all these realizations is called the typical set.



Formal statement:

**Theorem 1:** Let $X_1,\cdots X_n$ be i.i.d. and let $H(X)$ be the entropy of their common PMF $P_X$. Then $-\frac{1}{n}\log P_{X_1,\cdots,X_n}(x_1,\cdots,x_n)\rightarrow H(X)$ in probability.

**Proof:** 

$\log P_{X_1,\cdots,X_n}(x_1,\cdots, x_n)=\log\prod_{i=1}^n P_{X_i}(x_i)=\sum_{i=1}^n\log P_{X_i}(x_i)$.

Then $X_i$ i.i.d. $\Rightarrow \log P_{X_i}(x_i)$ i.i.d.

By the law of large numbers

$-\frac{1}{n}\sum_{i=1}^n\log P_{X_i}(x_i)\rightarrow \mathbb{E}[\log P_{X_i}(x_i)]=H(X)$ in probability.

Then a typical set of realizations of $X$, denoted by $A_\epsilon^{(n)}$ is defined as the set of sequences $(x_1, \cdots,x_n)\in\mathcal{X}^n$,s.t. $2^{-n(H(X)+\epsilon)}\le P_{X_1,\cdots,X_n}\le 2^{-n(H(X)-\epsilon)}$.

**Theorem(Property of Typical Set):** 

1. $(x_1,\cdots,x_n)\in A_\epsilon^{(n)}\Rightarrow \vert-\frac{1}{n}\log P_{X_1,\cdots,X_n}(x_1,\cdots,x_n)-H(X)\vert\le \epsilon$

2. $\forall\epsilon,\exists n$, s.t. $Pr(A_\epsilon^{(n)})>1-\epsilon$.

3. $\forall \epsilon,\exists n$, s.t. $(1-\epsilon)2^{n(H(Y)-\epsilon)}\le \vert A_\epsilon^{(n)}\vert\le 2^{n(H(X)+\epsilon)}.$

**Proof:**

1. By definition

2. Convergence in probability means that $\forall\delta>0$, for large enough $n=n(\delta),Pr(\vert -\frac{1}{n}\log P(X_1,\cdots,X_n)-H(X)\vert<\epsilon)\ge 1-\delta$. Take $\delta=\epsilon$.

3. For upper bound: $\vert A_\epsilon^{(n)}\vert\le 2^{n(H(X)+\epsilon)}$

$$
\begin{aligned}
1&\ge \sum_{(x_1,\cdots,x_n)\in A_\epsilon^{(n)}}Pr(x_1, \cdots,x_n) \\
&\ge \sum_{(x_1,\cdots,x_n)\in A_\epsilon^{(n)}}2^{-n(H(X)+\epsilon)} \\
&=2^{-n(H(X)+\epsilon)}\cdot \vert A_\epsilon^{(n)}\vert
\end{aligned}
$$

For lower bound: $(1-\epsilon)2^{n(H(X)-\epsilon)}\le \vert A_\epsilon^{(n)}\vert$

From 2: $Pr(A_\epsilon^{(n)})\ge 1-\epsilon$ for enough large $n$. 

$\Rightarrow 1-\epsilon\le Pr(A_\epsilon^{(n)})\le \sum_{(x_1,\cdots,x_n)\in A_\epsilon^{(n)}}2^{-n(H(X)-\epsilon)}=2^{-n(H(X)-\epsilon)}\vert A_\epsilon^{(n)}\vert$

**Application of AEP:** lossless data compression $X_1,\cdots,X_n\sim P_X$i.i.d.

For compression, we need to encode every sequence $(x_1,\cdots,x_n)\in\mathcal{X}^{n}$. 

For $(x_1,\cdots,x_n)\in A_\epsilon^{(n)}\subseteq \mathcal{X}^{n}$, prefix it by $0$,
$\vert A_\epsilon^{(n)}\vert\le 2^{n(H(X)+\epsilon)}\Rightarrow$ needs $nH(X)+1+1$ bits to compress the sequence.

For $(x_1,\cdots,x_n)\notin A_\epsilon^{(n)}$, prefix it by $1$,
then needs $n\log\vert\mathcal{X}\vert+1+1$ bits to compress the sequence.

So the expected length of encoding: Denote length of the encoding of $(x_1, \cdots,x_n)$ by $l(x_1,\cdots,x_n)$.

$$
\begin{aligned}
\Rightarrow \mathbb{E}[l(x_1,\cdots,x_n)]&\le Pr(A_\epsilon^{(n)})(n(H(X)+\epsilon)+2)+Pr(\bar{A_\epsilon^{(n)}})(n\log\vert\mathcal{X}\vert+2) \\
&\le n(H(X)+\epsilon)+2+\epsilon(n\log\vert\mathcal{X}\vert+2) \\
&=n(H(X)+\epsilon) \text{ for } \epsilon^\prime=\epsilon+\epsilon\log\vert\mathcal{X}\vert+\frac{2}{n}
\end{aligned}
$$

Thus we found a short description of $X_1,\cdots,X_n$.

Denote $B_\delta^{(n)}\triangleq$ the smallest set s.t. $Pr(B_\delta^{(n)})\ge 1-\delta$.

$$
\begin{aligned}
1-\delta-\epsilon\le Pr(A_\epsilon^{(n)}\cap B_\delta^{(n)})&=\sum_{(x_1, \cdots,x_n)\in A_\epsilon^{(n)}\cap B_\delta^{(n)}}Pr(x_1,\cdots,x_n) \\
&\le \sum_{(x_1, \cdots,x_n)\in A_\epsilon^{(n)}\cap B_\delta^{(n)}}2^{-n(H(X)-\epsilon)} \\
&\le \vert B_\delta^{(n)}\vert 2^{-n(H(X)-\epsilon)}
\end{aligned}
$$

$$
\Rightarrow \vert B_\delta^{(n)}\vert\ge(1-\delta-\epsilon)2^{n(H(X)-\epsilon)}\\
\Rightarrow \frac{1}{n}\log\frac{\vert B_\delta^{(n)}\vert}{\vert A_\epsilon^{(n)}\vert}\rightarrow 0
$$

**Expamle 1:** For $X_i\sim\text{Bernouli}(0.9)$, the most probable sequence is $(1,1,\cdots,1)$,which is in $B_\delta^{(n)}$ not in $A_\delta^{(n)}$.

**Types:** $\mathcal{X}$-finite set,$\vert\mathcal{X}\vert=q,\mathcal{X}=a_1, \cdots, a_q$. Denote $(x_1, \cdots,x_n)\in\mathcal{X}^n$ by $x$.The emperical distribution of $x$ is $P_x=(P_x(a_1), \cdots, P_x(a_q))$, where 

$$
\begin{aligned}
P_x(a)=\frac{\vert \{ i:x_i=a\} }{n}=\frac{n_a}{n},a\in\mathcal{X}
\end{aligned}
$$
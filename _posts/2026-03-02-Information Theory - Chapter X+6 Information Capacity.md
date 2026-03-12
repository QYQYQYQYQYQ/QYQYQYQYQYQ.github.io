---
title: "Information Theory - Chapter X+6 Information Capacity"
date: 2026-03-02
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---


In this chapter, we will introduce the information capacity of the channel. 


**Definition**: Let $X, P_X(x)$ on $\mathcal{X}$, $Y, P_Y(y)=\sum_{x\in \mathcal{X}}P_X(x)W(y\vert x)$ on $\mathcal{Y}$, where $W: \mathcal{X}\rightarrow \mathcal{Y}$ is DMC. The information capacity of $W$ is $C=\max_{P_X}I(X;Y)$.

**Examples**: 

1.$\text{BSC(p)}$: 

For $\text{BSC}(p)$, 

$$
W=\begin{pmatrix} 1-p&p\\p&1-p \end{pmatrix}.
$$

Note that

$$
\begin{aligned}
I(X;Y) &= H(Y) - H(Y\vert X) \\ 
&=H(Y)-\sum_{x=0}^1 P_X(x)H(Y\vert X=x).
\end{aligned}
$$

And, 

$$
\begin{aligned}
H(Y\vert X=x)&=P_Y(y\vert X=x)\log\frac{1}{P_Y(y\vert X=x)}\\
&=-P_Y(0\vert X=x)\log P_Y(0\vert X=x) - P_Y(1\vert X=x)\log P_Y(1\vert X=x) \\
&=-p\log p-(1-p)\log (1-p)=h(p)
\end{aligned}
$$

So,

$$
I(X;Y) = H(Y)-\sum_{x=0}^1P_X(x)h(p)=H(Y)-h(p)\le \log\vert \mathcal{Y}\vert  - h(p)=1-h(p).
$$

Take $P_X(0)=P_X(1)=\frac{1}{2}$, and $P_Y(0)=\frac{1}{2}p+\frac{1}{2}(1-p)=\frac{1}{2} \Rightarrow H(Y)=1$.

So the equality will hold when $X$ is a uniformly distribution, $C=\max I(X;Y)=1-h(p)$.

2.$\text{BEC}(p)$:

For $\text{BEC}(p)$, 

$$
W=\begin{pmatrix} 1-p&p&0\\0&p&1-p \end{pmatrix}.
$$

Denote 

$$
E=\textbf{1}\{Y \text{ is an erasure}\}.
$$

So, 

$$
H(Y) = H(Y, E)=H(E) + H(Y\vert E)=h(p)+H(Y\vert E),
$$

$$
\begin{aligned}
H(Y\vert E)&=Pr\{E=1\} H(Y\vert E=1) + Pr\{E=1\}H(Y\vert E=0) \\
&=0+(1-p) H(X) \quad \text{ assume }P_X(0)=\pi\\
&=(1-p) h(\pi) \\
\end{aligned}
$$

$$
\begin{aligned}
\Rightarrow & H(Y)=h(p)+(1-p)h(\pi),\\
& H(Y\vert X)=h(p). \\
\Rightarrow & I(X;Y) = (1-p)h(\pi)\le 1-p.
\end{aligned}
$$

When $\pi = \frac{1}{2}$, equality holds, and $C=\max_{P_X}I(X;Y)=1-p$, when $P_X$ is uniform distribution.

Generally, we can analyze the information capacity on symmetric channels. 

**Definition(Symetric Channels)**: A DMC $W$ is called symmetric if the rows of the matrix $W$ are permutations of each other and the columns are permutations of each other. 

**Definition(Weakly Symmetric)**: A DMC $W$ is called weakly symmetric if the rows are permutations of each other and all the columns add to the same number $\sum_{x\in \mathcal{X}}W(y\vert x)=A$.

**Theorem(Capacity of Weakly Symmetric DMC)**: Let DMC $W$ be weakly symmetric, then $C=\max_{P_X}I(X;Y)=\log\vert \mathcal{Y}\vert -H(W(\cdot\vert x)), x\in \mathcal{X}$, where the maximizer $P_X^\star(x)=\frac{1}{\vert \mathcal{X}\vert }$.

**Proof**: 

$$
\begin{aligned}
I(X;Y) &= H(Y)-H(Y\vert X) \\
&= H(Y)-\sum_{x\in \mathcal{X}}\sum_{y\in \mathcal{Y}}P_X(x)W(y\vert x)\log \frac{1}{W(y\vert x)} \\
&=H(Y)-\sum_{x}P_X(x)\sum_{y}W(y\vert x)\log\frac{1}{W(y\vert x)} \\
&=H(Y)-\sum_{x}P_X(x)H(W(\cdot\vert x))\\
\text{(symmetric, row permutation)} &=H(Y)-H(W(\cdot\vert x)) \\
&\le \log\vert \mathcal{Y}\vert -H(W(\cdot\vert x)).
\end{aligned}
$$

If $X$ is uniform, $P_Y(y)=\sum_{x\in\mathcal{X}}P_X(x)W(y\vert x)=\frac{1}{\vert \mathcal{X}\vert }\sum_{x\in \mathcal{X}}W(y\vert x)=\frac{A}{\vert \mathcal{X}\vert }$, which is a constant.

$\Rightarrow Y$ is uniform, and the equality holds.

**Remarks**:

1.$0\le C\le \min(\log\vert \mathcal{X}\vert , \log\vert \mathcal{Y}\vert ).$

2.$I(X;Y)$ is a continuous concave function of $P_X(x)$, so the maximum problem can be solved by KKT, gradient search method.

3.Channels do not have to be memoryless: information capacity can be still defined. But calculation of the capacity is difficult. For example Gilbert-Elliet channel, which is a finite Markov channel. 

We note that the main elements of the proof for BSC: 

(a). Choose codewords uniformly with $P_{X^n}(x^n)=\frac{1}{2^n}$.

(b). Decode only those $y^n$ that are conditionally typical for a unique codeword, which means

$$
y^n \in\mathcal{T}_\alpha(x^n(m))=\{y^n:\vert d_H(y^n, x^n)-np\vert \le n\alpha\}.
$$

So, 

$$
2^{-n(H(Y\vert X)+\epsilon)}=2^{-n(h(p)+\epsilon)}\le W(y^n\vert x^n(m))\le 2^{-n(h(p)-\epsilon)}=2^{-n(H(Y\vert X)-\epsilon)}.
$$

Now, we are going to analyze the information capacity while $X$ is not a uniformly distribution. Accordingly, we do not know $P_X$ and we would like to have an arguement for any $P_X$. So only conditional typicality does not suffice. We will introduce jointly typicality. 

**Define(Jointly Typicality)**: The jointly typical set of $XY$ is the points $(x, y)$ satisfies that

$$
\begin{aligned}
A^{(n)}_{\epsilon, XY}=\{(x^n, y^n)\in X^n\times Y^n:& 2^{-n(H(X)+\epsilon)}\le P_{X^n}(x^n)\le 2^{-n(H(X))-\epsilon}, \\
&2^{-n(H(Y)+\epsilon)}\le P_{Y^n}(y^n)\le 2^{-n(H(Y)-\epsilon)}, \\
&2^{-n(H(X, Y)+\epsilon)}\le P_{(X^n, Y^n)}(x^n, y^n)\le 2^{-n(H(X, Y)-\epsilon)}\}.
\end{aligned}
$$

**Theorem(Joint AEP)**: Let $(X^n, Y^n)\sim P_{XY}^n$ where $P_{XY}^n(x^n, y^n)=\prod_{i=1}^nP_{XY}(x_i, y_i)$. Then 

1.$Pr(A^{(n)}_{\epsilon, XY})\rightarrow 1(\text{as }n\rightarrow\infty )$

2.$\vert A^{(n)}_{\epsilon, XY}\vert \le 2^{n(H(X, Y)+\epsilon)}$

3.If $\tilde{X}^n\perp\tilde{Y}^n, (\tilde{X}^n, \tilde{Y}^n)\sim P_X^nP_Y^n$, then 

$$
\begin{aligned}
(1-\epsilon)2^{-n(I(X;Y)+3\epsilon)}&\le Pr((\tilde{x}^n, \tilde{y}^n)\in A^{(n)}_{\epsilon, XY})\\
&\le 2^{-n(I(X; Y)-3\epsilon)}.
\end{aligned}
$$

**Proof**: 

1.By WLLN, $\forall \gamma>0, \exists n$, s.t.

$$
\begin{aligned}
&Pr(\vert -\frac{1}{n}\log P_X^n(x^n)-H(X)\vert >\epsilon)<\frac{\gamma}{3}\\
&Pr(\vert -\frac{1}{n}\log P_Y^n(y^n)-H(Y)\vert >\epsilon)<\frac{\gamma}{3}\\
&Pr(\vert -\frac{1}{n}\log P_{XY}^n(x^n,y^n)-H(X, Y)\vert >\epsilon)<\frac{\gamma}{3}
\end{aligned}
$$

2.$1=\sum_{x^n, y^n}P_{XY}\ge \sum_{A_{\epsilon, XY}^{(n)}}P_{XY}^n(x^n, y^n)\ge\vert A_{\epsilon, XY}^{(n)}\vert 2^{-n(H(X, Y)+\epsilon)}$
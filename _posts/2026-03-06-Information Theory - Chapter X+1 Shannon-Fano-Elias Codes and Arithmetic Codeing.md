---
title: "Information Theory - Chapter X+1 Shannon-Fano-Elias Codes and Arithmetic Codeing"
date: 2026-03-06
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---

This chapter we will introduce Shnnon-Fano-Elias codes and arithmetic coding. 

## Shannon-Fano-Elias Coding

For $P=(p_1, \cdots, p_m), X\in Z_+^m, p_i>0(\forall i)$. Let $\bar{F}(x)=\sum_{a<x}P(a)\frac{1}{2}P(x)$. Take $l(x)=\lceil\log\frac{1}{P(x)}+1\rceil$. Then represent $x$ as the first $l(x)$ bits of $\bar{F}(x)$. Denote the set of $\bar{F}(x)$ as:

$$
S_1 = \{\bar{F}(x):x\in X\}
$$


Remark: 

(1). $S_1$ is nonsingular. Since $P(x)>0$ for all $x$, $\bar{F}(a)\neq\bar{F}(b)$ if $a\neq b$.

$\Rightarrow$ We can determine $x$ if $\bar{F}(x)$ is known $\Rightarrow$ $S$ is non-singular.

In general, $\bar{F}(x)$ is not expressible by a finite number of bits.

(2). Shannon-Fano-Elias: use the first $l(x)$ bits of $\bar{F}(x)$. denoted by $\lfloor\bar{F}(x)\rfloor_{l(x)}$. So the set of $\lfloor\bar{F}(x)\rfloor_{l(x)}$ is denoted by:

$$
S_2=\{\lfloor\bar{F}(x)\rfloor_{l(x)}:x\in X\},
$$

which is a prefix code.

Recall the cumulative probability distribution of $X$:

$$F(x)=Pr(X\le x)=\sum_{a\le x}P(a)$$
$$\bar{F}(x)-\lfloor\bar{F}(x)\rfloor_{l(x)}<\frac{1}{2^{l(x)}}$$

Since $l(x)=\lceil\log\frac{1}{p(x)}\rceil +1$, then 

$$
\begin{aligned}
&\frac{1}{2^{l(x)}}=\frac{1}{2}\frac{1}{2^{\lceil\log\frac{1}{p(x)}\rceil}}\le\frac{P(x)}{2}=\bar{F}(x)-F(x-1)\\
\Rightarrow&\bar{F}(x)-\lfloor\bar{F}(x)\rfloor_{l(x)}<\bar{F}(x)-F(x-1)\\
\Rightarrow&\lfloor\bar{F}(x)\rfloor_{l(x)}\in (F(x-1), \bar{F}(x)]\\
\Rightarrow&\{\lfloor\bar{F}(x)\rfloor_{l(x)}:x\in X\} \text{ is non-singular.}
\end{aligned}
$$

Now check $\lfloor\bar{F}(x)\rfloor_{l(x)}$ is also prefix-free.

Associate $\lfloor\bar{F}(x)\rfloor_{l(x)}=0.z_1z_2\cdots z_l$ with the interval.

$$
I_x=[0.z_1z_2\cdots z_l, 0.z_1z_2\cdots z_l+\frac{1}{2^l}).
$$

If we can show $I_x\subset(F(x-1), \bar{F}(x)]$, then the code is prefix-free.

For lower end of $I_x$: 

$$
\lfloor\bar{F}(x)\rfloor_{l(x)}\in(F(x-1), \bar{F}(x)].
$$

For upper end of $I_x$: 

$$
\begin{aligned}
\lfloor\bar{F}(x)\rfloor_{l(x)}+\frac{1}{2^{l(x)}}&\in (F(x-1)+\frac{1}{2^{l(x)}}, \bar{F}(x)+\frac{1}{2^{l(x)}}]\\
&\subseteq (F(x-1)+\frac{1}{2^{l(x)}}, \bar{F}(x)] \\
&= (F(x-1)+\frac{1}{2^{l(x)}}, F(x)]
\end{aligned}
$$

$$
\begin{aligned}
\Rightarrow& I_x\subset (F(x-1), F(x)]\\
\Rightarrow& \text{all intervals } I_x, x\in X \text{ are disjoint}\\
& \vert \cup_xI_x\vert =\sum_{x}\vert I_x\vert <1. \\
\Rightarrow&\{\lfloor\bar{F}(x)\rfloor_{l(x)}:x\in X\} \text{ is prefix free}.
\end{aligned}
$$

(3). The encoding procedure does not require ordering the symbols $x\in X$ according to their probabilities. Unlike Huffman codes calculate the probabilities of all length-$n$ sequence. So for $\vert X\vert ^n$ sequences, complexity is exponential in $n$.

## Arithmetic coding

An extension of Shannon-Fano-Elias coding, encodes sequences of random variables with a complexity linear in $n$.[used in JPEG].

Idea: represent a sequence of RVs by a subinterval of $[0, 1]$.

The encoding function of arithmetic coding relies on the following lemma.

**Lemma**: Let $Y$ be a random variable with continuous probability distribution function $F(y)$. Let $U=F(Y)$. Then $U$ is uniformly distributed in $[0, 1]$.

**Proof**: 

For $u\in [0, 1], F_U(u)=P(U\le u)=P(F(Y)\le u)=P(Y\le F^{-1}(u))=F[F^{-1}(u)]=u.$

$X_1, X_2, \cdots$ takes values in alphabet $\mathcal{X}$. Let $X=0.X_1X_2\cdots$ be the real-alued random variable between [0, 1]. Then the codeword of $X$ with realization $x=0.x_1x_2\cdots$ is given by

$$
U=F_\mathcal{X}(X)=F_\mathcal{X}(0.X_1X_2\cdots)=0.F_1F_2\cdots.
$$

Assuming the distribution on $X^\infty$ has no atoms, by the lemma, we have $U$ is uniformly distributed on $[0, 1]$. In other words $F_i\sim \text{Bornouli}(\frac{1}{2})$.

Remark: Arithmetic codes are non-singular.

The probability distribution function forms an invertible mapping from infinite source seq. to incompressible infinite seq.

Associate the seq. $X_1, X_2, \cdots X_n$ with the interval $[0.x_1x_2\cdots x_n, 0.x_1\cdots x_n+\frac{1}{2^n})$

Under the probability transform, the interval is mapped to

$$
I_{x^n}=[F_X(0.x_1x_2\cdots x_n), F_X(0.x_1x_2\cdots x_n+\frac{1}{2^n})).
$$

For $u\in I_{x^n}$, its preimage is a sequence that starts with $x_1, x_2, \cdots,x_n$.

So we can reconstruct $x_1, \cdots, x_n$ using $u$.

$\Rightarrow$ We may use any $u\in I_{x^n}$ as a codeword for $x_1, \cdots, x_n$.

Recall: what point does Shannon-Fano-Elias choose? $u=\lfloor\bar{F}(x)\rfloor_{l(x)}, l(x)=\lceil\log\frac{1}{p(x)}\rceil+1$.

So far, we assumed we can represent a real number with arbitrary accuracy. But in practice, we only have finite precision. Instead of infinite precision points, consider the subintervals of $[0, 1]$.

Note that when we observe more and more RVs, the length of $I_{x^n}$ decreases.

Observe that $F_{X}(0.x_1x_2\cdots x_n)=F_{X}(0.x_1, \cdots x_{n-1})+P_X(0.x_1x_2\cdots x_{n-1})\sum_{y\in X}P_{X_n\vert X_1, X_2, \cdots, X_{n-1}}(y\vert 0.x_1x_2\cdots x_{n-1})$.

So $F_{X}(0.x_1\cdots x_n)$ can be computed sequentially with the complexity of $n\vert \mathcal{X}\vert $.

This is useful because it allows to incorporate learned information about the stream. (we may Laplace estimate for $P_{X_n\vert X_1, \cdots, X_{n-1}}$.
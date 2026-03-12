---
title: "Information Theory - Chapter X+3 Slepian-Wolf Coding"
date: 2026-03-05
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---



Slepian-Wolf Coding is a fixed-length and almost lossless compression with some side information, which is to deal with the sequence of the source.


For source $(X, Y)$, $Y$ is known at the decompressor PMF for $(X, Y)$, which is bounded by $P_{XY}$.

Notations:

$$
\begin{aligned}
f&: X\rightarrow\{0,1\}^k \qquad \text{encoding function(compressor)} \\
g&: \{0,1\}^k\times y\rightarrow X \qquad \text{decoding function(decompressor)}
\end{aligned}
$$

Denote $P_e=P(g(f(X), Y)\neq X)$, we call $(f, g)$ a $(k, \epsilon)$ code if $P_e\le \epsilon$.

Then the minimum probability of errors is defined as:

$$
\epsilon^*(X\vert Y,k)=\inf\{\epsilon: \text{there exists a }(k, \epsilon)\text{ code for }X\text{ given }Y\}.
$$

So the question is do there exist a code with small/vanishing $P_e$?

**Theorem**: $\forall \tilde{k}>0, \epsilon^*(X\vert Y, k)\le P(\log\frac{1}{P_{X\vert Y}(X\vert Y)}\ge k-\tilde{k})+2^{-\tilde{k}}$.

**Proof:** 

[The proof is to show there exists a code with $P_e=P_r+2^{-\tilde{k}}$]

Generate a code $C$ with $i.i.d.$ codewords independent of $(X, Y)$:

$$
C=\{c(x)\in \{0,1\}^k:x\in X\}
$$

Define $f(x)=c(x)$, and

$$
g(w, y)=\left\{
    \begin{aligned}
        &x, \quad \text{if there exists a unique } x\in X \text{ s.t. } c(x)=w\text{ and }\log\frac{1}{P_{X\vert Y}(X\vert Y)}< k-\tilde{k}  \\
       & 0, \quad \text{otherwise} 
    \end{aligned}
\right.
$$

There are two ways to make errors. 

1. There exists $x'\in X, x'\neq x, s.t.\ c(x')=c(x)$ and $\log\frac{1}{P_{X\vert Y}(X\vert Y)}<k-\tilde{k}$.

2. $\log \frac{1}{P_{X\vert Y}(x\vert y)}\ge k-\tilde{k}$. (This is independent of the code $C$).

Define 

$$
A(C, x, y)=\{x'\neq x: c(x)= c(x')\text{ and }\log\frac{1}{P_{X\vert Y}(x'\vert y)}< k-\tilde{k}\}.
$$

For a fixed $C$, 

$$
\begin{aligned}
P_e&=P\{A(C, X, Y) \neq \emptyset  \text{ or }\log\frac{1}{P_{X\vert Y}(X\vert Y)}\ge k-\tilde{k}\}\\
&\le P\{A(C, X, T)\neq\emptyset \} + P\{\log\frac{1}{P_{X\vert Y}(X\vert Y)}\ge k-\tilde{k} \}
\end{aligned}
$$

For the first term, consider its expectation:

$$
\begin{aligned}
\mathbb{E}_C[P\{A(C, X, Y)\neq \emptyset \}] &= \mathbb{E}_C\{\mathbb{E}_{XY}[\boldsymbol{1} \{\exists x'\neq X, c(X)=c(x'), \log\frac{1}{P_{X\vert Y}(x'\vert Y)}< k-\tilde{k}\}]\} \\
&\le\mathbb{E}_{CXY}[\sum_{x'\neq X}\boldsymbol{1}\{c(X)=c(x')\}\boldsymbol{1}\{\log\frac{1}{P_{X\vert Y}}(x'\vert Y)< k-\tilde{k}\}] \\
&=2^{-k}\mathbb{E}_{XY}[\sum_{x'\neq X}\boldsymbol{1}\{\log\frac{1}{P_{X\vert Y}(x'\vert Y)}< k-\tilde{k}\}]\\
&= 2^{-k}\mathbb{E}_{Y}[\sum_{x\in X}P_{X}(x)\sum_{x'\neq x}\boldsymbol{1}\{\log\frac{1}{P_{X\vert Y}(x'\vert Y)}< k-\tilde{k}\}] \\
&\le 2^{-k}\mathbb{E}_{Y}[\sum_{x\in X}P_{X}(x)\sum_{x'\in X}\boldsymbol{1}\{\log\frac{1}{P_{X\vert Y}(x'\vert Y)}< k-\tilde{k}\}] \\
&= 2^{-k}\mathbb{E}_{Y}[\sum_{x'\in X}\boldsymbol{1}\{\log\frac{1}{P_{X\vert Y}(x'\vert Y)}< k-\tilde{k}\}] \\
&\le 2^{-k} \sum_{x'\in X}\boldsymbol{1}\{x':\log\frac{1}{P_{X\vert Y}(x'\vert y)}< k-\tilde{k}\} \\
&=2^{-k}\vert B\vert  \\
&\le 2^{-k} 2^{k-\tilde{k}}=2^{-\tilde{k}}
\end{aligned}
$$

where

$$
B=\{x': \log\frac{1}{P_{X\vert Y}(x'\vert y)}< k-\tilde{k}\}.
$$
So there exists $C$ that 
$$
P(A(C, X, Y)\neq\emptyset )\le \mathbb{E}_C[P(A(C, X, Y)\neq\emptyset )]\le 2^{-\tilde{k}}.
$$

So 

$$
P_e\le 2^{-\tilde{k}}+P\{\log\frac{1}{P_{X\vert Y}(X\vert Y)}\ge k-\tilde{k}\}.
$$

**Corollary**: If $(X, Y)=(S^n, T^n)$ and $(S_i, T_i)$ are $i.i.d.$, then 

$$
\lim_{n\rightarrow\infty} \epsilon^*(S^n\vert T^n, nR)=0, 
$$

if $R>H(S\vert T)$.

Also one can also show if $R<H(S_1\vert T_1)$ then 

$$
\lim_{n\rightarrow\infty} \epsilon^*(S^n\vert T^n, nR)=1. 
$$
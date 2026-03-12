---
title: "Information Theory - Chpter X+4 Channel Coding"
date: 2026-03-04
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---

Channel Coding. 

### Discrete memoryless channels(DMC)

$$
\mathcal{X} - \text{input alphabet} \\
\mathcal{Y} - \text{output alphabet}
$$

A mapping $W: \mathcal{X}\rightarrow \mathcal{Y}$ is called stochastic if the image of $x\in \mathcal{X}$ is a random variable taking values in $\mathcal{Y}$.

DMC is a stochastic mapping $W$. Denote $P(y\vert x)$ by $W(y\vert x)$, which is the conditional probability of $y$ given $x$, so $\sum_{y\in \mathcal{Y}}=1$.

The image of $u$ in $\mathcal{X}^n$ is called a (channel) code $C$. ($(f, g)$ is also called a code)

$\underline{y}=y^n=(y_1, \cdots, y_n)\quad \underline{x}=x^n=(x_1, \cdots, x_n)\quad W^n(y\vert x)=\Pi_{i=1}^nW(y_i\vert x_i)$.

Note that mapping $W$ can be represented by a stochastic matrix where the rows are labeled by elements of $\mathcal{X}$ and the columns are labeled by elements of $\mathcal{Y}$.

For channel codes, Let:

$$
\begin{aligned}
\mathcal{U}=\{1, \cdots, M\}
\end{aligned}
$$

and $f:\mathcal{U}\rightarrow \mathcal{X}^n$ be a mapping.

A code $C$ of length $n$ over $\mathcal{X}$ is the image of $f$ in $\mathcal{X}^n$. We say a message $m\in \mathcal{U}$ is encoded into a codeword $x^n(m)\in \mathcal{C}$ if $f(m)=x^n(m)$. The set of codewords 

$$
\mathcal{C}=\{x^n(1), \cdots, x^n(M)\}
$$

is called a channel code, and $\mathcal{C}\subset\mathcal{X}^n$.
The number $R=\frac{1}{n}\log M$ is called the rate of the code $\mathcal{C}$.

Note that $W(y^n\vert x^n(m))$ is probability of $y^n$ by transmitting $x^n(m)$ over $W^n$. Messages are encoded so that we may recover the messages from $y^n$, which is called error correction.

Decoder and decoding rules: Let $g: \mathcal{Y}^n\rightarrow \mathcal{U}$ be a (deterministic) mapping. Construct $g$ so as to minimize the error probability of decoding:

$$
P_e=Pr\{g(f(U))\neq U\},
$$

where $U$ is the random variable corresponding to the message.

Optimal decoding rules: Let $P_U$ be the probability distribution on $\mathcal{U}$.
The posterior probability that $m$ was transmitted given $y^n$ is received by:

$$
\begin{aligned}
P_U(m\vert y^n)&=\frac{P_U(m)W^n(y^n\vert x^n(m))}{P(y^n)}\\
&=\frac{P_U(m)W^n(y^n\vert x^n(m))}{\sum_{m=1}^M P_U(m)W(y^n\vert x^n(m))}
\end{aligned}
$$

If $g(y^n)=m$, then 

$$
\begin{aligned}
P_e&=\sum_{y^n} Pr(m\neq U\vert y_n) P(y^n) \\
&=\sum_{y^n} (1-P_U(m\vert y^n))P(y^n)
\end{aligned}
$$

To minimize $P_e$, decode $y^n$ to $m$ s.t.

$$
P(m\vert y^n)\ge P(m'\vert y^n) \quad \forall m'\neq m
$$

The rule is called the maximum a posterior (MAP) decoder.

Suppose that $U\sim \text{uniform distribution}$, i.e., $P_U(m)=\frac{1}{M}$, then MAP decoder is equivalent to the maximum likelihood decoder $g_{ML}$ that decodes $y^n$ to $m$ if $W^n(y^n\vert x^n(m))\ge W^n(y^n\vert x^n(m')), \forall m'\neq m$.

If $U$ is not uniform, ML is suboptimal.

Remark: ML and MAP decoders are computationally hard because we need to search for all $x^n\in \mathcal{X}^n$ in order to find $g(y^n)$.
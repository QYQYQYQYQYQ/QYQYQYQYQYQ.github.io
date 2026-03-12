---
title: "Information Theory - Chapter X Lempel-Ziv coding"
date: 2026-03-07
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---



This chaper is to talk about LZ78 and its asympotic optimaling.




LZ78: Ride along the sequence: if what you have observed after the last reset is not in the dictionary, place it in the dictionary with $(\text{pointer to the prefix}, \text{last symbol})$ in the encoding. Below shows an example: 

For a $0-1$ string $(0000001101010000011010)$, first parse the string into phrases: $(0,00,000,1,10,101,0000,01,1010)$. And then encode the phrases as two parts, the first is the index of the prefix(if no prefix, set to $0$) and the second is the last digit. The encoding result is shown below:

| index of prefix | last digit |
| :-------------: | :--------: |
|        0        | (0000, 0)  |
|       00        | (0001, 0)  |
|       000       | (0010, 0)  |
|        1        | (0000, 1)  |
|       10        | (0100, 0)  |
|       101       | (0101, 1)  |
|      0000       | (0011, 0)  |
|       01        | (0001, 1)  |
|      1010       | (0110, 0)  |

Now we consider about its performance.

**The worst case:** The number of phrases $C(n)$ in a sequence of length $n$ satisfying

$$
C(n)\le \frac{n}{\log n}(1+o(1)).
$$

**Proof:**

First denoted by $n_k$ the sum of lengths of all strings of length $\le k$. So 

$$
n_k=\sum_{j=1}^kj2^j=(k-1)2^{k+1}+2. \\
$$

$$
\begin{aligned}
C(n_k)\le \sum_{j=1}^k2^j = 2^{k+1}-2&=\frac{(k-1)2^{k+1}-2(k-1)}{k-1} \\
&<\frac{(k-1)2^{k+1}+2}{k-1} = \frac{n_k}{k-1}.
\end{aligned}
$$

Let $n_k\le n<n_{k+1}$, more precisely, we can write $n=n_k+m$

$$
\begin{aligned}
C(n)&\le \frac{n_k}{k-1} + \frac{m}{k-1}\\
&\le\frac{n_k}{k-1} + \frac{m}{k-1}\\
&=\frac{n}{k-1}.
\end{aligned}
$$

To bound $k$, note that

$$
\begin{aligned}
&n\ge n_k\ge 2^k \Rightarrow k\le \log n \\
&n< n_{k+1}=k2^{k+2}+2\le (k+2)2^{k+2} \le (\log n +2)2^{k+2}
\end{aligned}
$$

$$
\Rightarrow k+2\ge \log\frac{n}{\log n+2}
$$

$$
\begin{aligned}
\Rightarrow k-1&\ge \log n - \log(\log n +2) -3 \\ 
&\ge (1-\epsilon_n)\log n
\end{aligned}
$$

where

$$
\epsilon_n=\min\{1, \frac{\log\log n +4}{\log n}\}\rightarrow0(\text{when } n\rightarrow \infty).
$$

So

$$
C(n)\le \frac{n}{k-1}\le \frac{n}{(1-\epsilon_n)\log n}. ∎
$$

For random string, LZ78 asymptotically approaches the entropy.

**Random cases:** Suppose $X$ is a memoryless source with PMF $P_X(i)=P_i$. $P(x^n)=\prod_{i=1}^nP_X(x_i)=\prod_{i=1}^n P_{x_i}$. Parse $x^n=(x_1, x_2, \cdots, x_n)$ into distinct phrases $(x_1, x_2, \cdots, x_n)=(y_1, y_2, \cdots , y_C)$. So $P(x^n)=\prod_{i=1}^C P(y_i)$.

**Proof:**

Let $C_L$ be the number of phrases of length $l$ among $y_i$, $i=1, \cdots, c$.

Before going on, we prove following lemma first:

**Ziv's Lemma**: 

$$
-\log P(x^n)\ge \sum_lc_l\log c_l
$$

**Proof of lemma**: 

$$
P(x^n)=\prod_l\prod_{y_i: |y_i|=l}P(y_i)
$$

We know that all $y_i$ are distinct, so

$$
\begin{aligned}
&\sum_{y_i:|y_i|=l}\le 1 \\
\Rightarrow& \prod_{y_i:|y_i|=l} P(y_i)\le (\frac{1}{c_l})^{c_l} \\
\Rightarrow& \log P(x^n)\le \sum_{l}c_l\log \frac{1}{c_l} ∎
\end{aligned}
$$

Suppose there are $m_i$ entries of symbol $i$ among $x_1, \cdots, x_n$. Then 

$$
P(x^n)=\prod_{i\in X} P^{m_i}_i.
$$

Invoking LLN, $m_i \approx nP_i$, so 

$$
P(x^n)\approx \prod_{i\in X} P^{nP_i}_i,
$$

$$
\log P(x^n)\approx n\sum_{i\in X} P_{i} \log P_i \approx -nH(P).
$$

So with Ziv's lemma,

$$
H(P)\ge \frac{\sum_l c_l\log {c_l}}{n}.
$$

So we will prove that LZ comporesses to entropy if we show that:

$$
\sum_{l}c_l\log c_l\approx C\log(C).
$$

We note that

$$
\sum_l c_l=C \Rightarrow \sum_{l}c_l\log c_l=C\log C+C\sum_l\frac{c_l}{C} \log \frac{c_l}{C}, 
$$

where $-\sum_l\frac{c_l}{C}\log\frac{c_l}{C}$ is entropy of the distribution $Q=(q_i=\frac{c_i}{C}, i=1, 2, \cdots).$

Consider the following maximization problem:

$$
\begin{aligned}
\max H(Q)\\
s.t. \sum_l{lc_l=n}
\end{aligned}
$$

An exact solution can be found, but a very crude estimate is 

$$
\begin{aligned}
	H(Q)=o(log\frac{n}{C}) &\Rightarrow nH(P)\ge\sum_{l}c_l\log c_l=C\log C-o(\log\frac{n}{C})\\
	&\Rightarrow \frac{C\log C}{n}\le H(P) + \frac{o(\log(\frac{n}{C}))}{n}. ∎
\end{aligned}
$$

As $C$ is the number of the phrases, $\log C$ is the length to be coded. so $\frac{C\log C}{n}$ is bounded by $H(P)$. asymptotically optimal holds.
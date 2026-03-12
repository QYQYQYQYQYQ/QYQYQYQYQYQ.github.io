---
title: "Information Theory - Chpter X+5 Achievability of BSC(p)"
date: 2026-03-03
categories: [学术, 信息论]
tags: [信息论]
mathjax: true
---


### Informal discussion of Shannon's channel coding theorem for Binary Symmetry Coding.

$$
\text{BSC}(p): W=\{0,1\}\rightarrow \{0,1\}, W=\begin{pmatrix} 1-p&p\\p&1-p \end{pmatrix}, p\le \frac{1}{2}.
$$

Let 

$$
d_H(x^n, y^n)=\vert \{i:x_i\neq y_i\}\vert 
$$

be the Hamming distance between $x^n$ and $y^n$. So the typical value of $d_H(x^n, y^n)\approx np$.

For small $\alpha>0$:

$$
P\{\vert d_H(x^n, y^n)-np\vert \ge n\alpha\}
$$

is small.

We may define:

$$
g(y^n)=
\left\{
\begin{aligned}
  m ,& \quad \text{if there exists a unique } x^n(m)\in C\ s.t.\ \vert d_H(x^n(m), y^n)-np\vert \le n\alpha \\
  1 ,& \quad otherwise
\end{aligned}
 \right.
$$

We call $y^n$ with $\vert d_H(x^n,y^n)-np\vert \le n\alpha$ for some $\alpha\ge 0$ typical with $x^n$. Define typical set:

$$
\begin{aligned}
\mathcal{T}_\alpha(x^n(m))\triangleq \{y^n\in \{0,1\}^n:\vert d_H(x^n(m), y^n)-np\vert \le n\alpha\}. \\
\vert \mathcal{T}_\alpha(x^n(m))\vert =\sum_{i:\vert i-np\vert \le n\alpha} \begin{pmatrix} n\\i \end{pmatrix} \approx 2^{nh(p)}
\end{aligned}
$$

So when there is non overlapping between balls, it can be decoded uniquely.

So $M\cdot 2^{nh(p)}\le 2^n$, e.g., $R<1-h(p)-\epsilon$, it is possible to transmit reliably.

If $M\cdot 2^{nh(p)}>2^n$, e.g., $R>1-h(p)+\epsilon$, then on average $y^n$ is typical for an exponential number $2^{n\epsilon}$ of $x^n\in \mathcal{C}$ and $P_e\approx 1$.

Capacity: This shows there is a dividing point $R=1-h(p)$ for reliable communications over $\text{BSC}(p)$. In general, this value of the rate is called the capacity of the channel $W$.

**Lemma**: Let $0\le \lambda\le \frac{1}{2}$, then 

$$
\frac{1}{n+1}2^{nh(\lambda)}\le \sum_{i=0}^{n\lambda}\begin{pmatrix} n\\i \end{pmatrix}\le 2^{nh(\lambda)}.
$$

**Proof**: For the lower bound, 

$$
\sum_{i=0}^{n\lambda}\begin{pmatrix} n\\i \end{pmatrix}\ge\begin{pmatrix} n\\n\lambda \end{pmatrix}\ge \frac{1}{n+1}2^{nh(\lambda)}
$$

For the lower bound,

$$
\begin{aligned}
1=(\lambda+(1-\lambda))^n &\ge \sum_{i=0}^{n\lambda}\begin{pmatrix} n\\i \end{pmatrix}\lambda^i(1-\lambda)^{n-i} \\
&\ge \sum_{i=0}^{n\lambda}\begin{pmatrix} n\\i \end{pmatrix}(1-\lambda)^n(\frac{\lambda}{1-\lambda})^{n\lambda} \\
&=2^{-nh(\lambda)}\sum_{i=0}^{n\lambda} \begin{pmatrix} n\\i \end{pmatrix}.
\end{aligned}
$$


### Formal Discussion of Achivability of BSC(p)

**Notations**:

$$
\begin{aligned}
&D_{ML}(x^n(m))=\{y^n\in \{0,1\}^n: \forall m^\prime\neq m, W^n(y^n\vert x^n(m))\ge W^n(y^n\vert x^n(m^\prime))\}.\\
&D(x^n(m))=\{y^n\in \{0,1\}^n: g(y^n)=m\}\\
&\lambda_m=\sum_{y^n\in D^C(x^n(m))}W^n(y^n\vert x^n(m)) \quad (\text{for } U \sim \text{Uniform Distribution})\\
&\lambda_{max}=\max_{m\in \mathcal{U}} \lambda_m
\end{aligned}
$$

**Theorem**: TGiven $\epsilon>0, \gamma>0, p\le \frac{1}{2}$ and $R\le 1-h(p)-\gamma$, there exists $n_0=n_0(\epsilon, \gamma)$ s.t. $\forall n\ge n_0$, there exists a code $C$ of size $2^{nR}$ whose maximum error probability of decoding over $\text{BSC}(p)$ satisfies $\lambda_{max}\le \epsilon$.

**Proof**: $M=2^{nR}$, choose 

$$
C=\{x^n(1), \cdots, x^n(M)\} \subset \{0,1\}^n
$$

by randomly assigning codewords to messages with $P(f(m)=x^n(m))=\frac{1}{2^n}$ independently.

Suppose $y^n$ is received vector, $\mathcal{Y}^n$ is corresponding random variable. Consider the following decoder $g: \mathcal{Y}^n\rightarrow \mathcal{U}$.

$$
g(y^n)=\left\{
    \begin{aligned}
        &m, \quad \text{if there exists a unique } x^n(m)\in C \text{ s.t. } y^n\in \mathcal{T}_\alpha(x^n(m))  \\
       & 1, \quad \text{otherwise} 
    \end{aligned}
\right.
$$

Let 

$$
Z_m=\textbf{1}\{\mathcal{Y}^n\in \mathcal{T}_\alpha(x^n(m))\}, m=1, \cdots, M.
$$

Suppose the transmitted codeword is $x^n(1)$. So the code will be decoded wrongly when it lies out of $\mathcal{T}_\alpha(x^n(1))$ or it lies in  any other $\mathcal{T}_\alpha(x^n(m)), m\neq 1$. 

$$
\lambda_1\le Pr\{Z_1=0\} + Pr\{\sum_{m=2}^MZ_m\ge 1\}.
$$

For the first term, 

$$
\begin{aligned}
Pr\{Z_1=0\}&=Pr\{\mathcal{Y}^n\notin \mathcal{T}_\alpha(x^n(1))\}\\
&=Pr\{\vert d_H(\mathcal{Y^n, x^n(1)}-np)>n\alpha\vert \} \\
\text{(Chebyshev's inequality)}&\le \frac{np(1-p)}{(n\alpha)^2}
\end{aligned}
$$

Take $\alpha=n^{-\frac{1-\delta}{2}}, \delta>0$,

$$
Pr\{Z_1=0\}\le \beta, \beta>0.
$$

For the second term, consider

$$
\begin{aligned}
Pr\{Z_m=1\}=\frac{\vert \mathcal{T}_\alpha(x^n(m))\vert }{2^n}&\le \frac{2^{nh(p+\alpha)}}{2^n}\\
&=2^{-n(1-h(p+\alpha))}
\end{aligned}
$$

So,

$$
\begin{aligned}
Pr\{\sum_{m=2}^M Z_m\ge 1\}&\le M Pr\{Z_m=1\}\\
&\le M 2^{-n(1-h(p+\alpha))}\\
&= 2^{nR}2^{-n(1-h(p+\alpha))}\\
&\le 2^{n(1-h(p)-\gamma)}2^{-n(1-h(p+\alpha))}
\end{aligned}
$$

Let us write $h(p+\alpha)=h(p)+\alpha^\prime$. As $\alpha$ is small $\Rightarrow$ $\alpha^\prime$ is small. Because $p<\frac{1}{2}$, $\alpha^\prime>0$. 

$$
\Rightarrow Pr\{\sum_{m=2}^M Z_m\ge 1\}\le 2^{-n(\gamma-\alpha^\prime)}
$$

By taking $\alpha$ sufficiently small, we can gaurantee that 

$$
Pr\{\sum_{m=1}^MZ_m\ge 1\}\le \beta, \beta>0.
$$

Thus, $\lambda_1<2\beta$.

Let us compute the average probability of error over all possible choice of the code $C$.

$$
P_e(C)=\sum_{m=1}^M P_U(m)\lambda_m(C)=\frac{1}{M}\sum_{m=1}^M\lambda_m(C)
$$

$$
\begin{aligned}
\mathbb{E}P_e(\mathcal{C})&=\sum_{C\in \mathcal{C}}P_\mathcal{C}(C)P_e(C)\\
&=\frac{1}{M}\sum_{C\in \mathcal{C}} \sum_{m=1}^MP_{\mathcal{C}}(C)\lambda_m(C)\\
&\le \frac{1}{M}\sum_{C\in \mathcal{C}} \sum_{m=1}^MP_{\mathcal{C}}(C)2\beta\\
&=2\beta
\end{aligned}
$$

This implies there exists a code $C^\star$ s.t. $P_e(C^\star)\le 2\beta$.

Also, for $R^\prime=R+\frac{1}{n}, M=2^{nR^\prime}$, we can find a code $C^\star$ that $P_e(C^\star)\le 2\beta, \vert C^\star\vert =M^\prime$.

So,

$$
Pr\{\lambda_U(C^\star)\ge 2P_e(C^\star)\}\le \frac{P_e(C^\star)}{2P_e(C^{\star})}=\frac{1}{2}.
$$

This means that at least half of the messages satisfy $\lambda_m(C^\star)\le 2P_e(C^\star)\le 4\beta$.

So we can sort the codewords from a increasing order by $\lambda_m(C^\star)$, then the code for the best half of the messages is chosen to form the code, denoted by $\tilde{C}^\star$. And the size of $\tilde{C}^\star$ is $\frac{M^\prime}{2}=2^{n(R^\prime-\frac{1}{n})}=2^{nR}$. The maximum error probability $\lambda_{max}(\tilde{C}^{\star})\le 4\beta$. We take the $\epsilon=\frac{\beta}{4}$.

**Remark**: $\lambda_{max}$ falls as $n^{-\epsilon}$. But when we using the optimal decoder, one can show that $\lambda_{max}$ falls exponentially.

**Theorem**(no provement): For any $0\le R<1-h(p)$, there exists a sequence of codes $C_i, i=1, 2, \cdots$ of growing length $n$, s.t. $\frac{\log\vert C_i\vert }{n}\rightarrow R$ and $\lambda_{max}(C_i)\le 2^{-n(D(\delta(R)\Vert p)(1-o(1)))}$, where $D(x\Vert y)=x\log \frac{x}{y}+(1-x)\log\frac{1-x}{1-y}, \delta(R)=h^{-1}(1-R), o(1)\rightarrow 0 \text{ as } n\rightarrow \infty, \lambda_{max}\rightarrow 0 \text{ as } n\rightarrow \infty$.

**Remark**: 

1.From this theorem, for a given $\epsilon$ and $\lambda_{max}\le \epsilon$, what is the smallest $n$?
As $R\approx 1-h(p)$, we have $\delta(R)\approx p, D(\delta(1-h(p))\Vert p)=D(p\Vert p)=0$, so

$$
\lambda_{max}(C_i)\le 1,
$$

which is meaningless.

So if $R=1-h(p)-\gamma$, then $\delta(R)=p+\gamma^\prime$ for some small $r^\prime$.

Expand $D$ into a power series in the neighborhood of $\delta=p$ and obtain $D(\delta\Vert p)=o((\delta-p)^2), n\ge\frac{\log \frac{1}{\epsilon}}{(\delta-p)^2}$(with some constants omitted).

2.Rephrase the question by finding how $\gamma$ "gap to capacity" depend on the code length $n$?

As $n\ge\frac{\log \frac{1}{\epsilon}}{(\delta-p)^2} \Rightarrow \delta-p\ge(\log\frac{1}{\delta})^{\frac{1}{2}}\frac{1}{\sqrt{n}}$.

Using $\delta=h^{-1}(1-p)$, we have $R\le 1-h(p)-o(\frac{1}{\sqrt{n}})$.

The gap to capacity for optimal codes scales as $n^{-\frac{1}{2}}$, which is called a "finit-length scaling problem".
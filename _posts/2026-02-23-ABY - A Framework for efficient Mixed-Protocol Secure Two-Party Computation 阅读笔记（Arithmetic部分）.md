---
title: "ABY - A Framework for efficient Mixed-Protocol Secure Two-Party Computation 阅读笔记（Arithmetic部分）"
date: 2026-02-23
categories: [学术, 安全计算]
tags: [安全多方计算, ABY]
---


今天看了秘密分享架构中的ABY架构，尤其看了Arithmetic sharing部分，对于该秘密分享机制下的加法与乘法的计算有了一定的了解，而且了解了如何通过Pailler同态加密方法产生c=axb的三元组。但是对于OT-Base产生三元组的方法不太了解，明天会对非对称加密体系，安全分享公钥的方法还有Diffie-Hellman算法进行学习以求更加熟悉OT-Base办法


## 1). Share Semantics:

### 1. Shared values: 

对于一个数$x$的l字节Arithmetic共享$\langle x\rangle ^A$，我们有$\langle x\rangle^A_0 + \langle x\rangle^A_1=\langle x\rangle^A , \langle x\rangle_0^A,\langle x\rangle_1^A\in Z_{2^l} $

### 2. Sharing: 

定义$Shri^A_i(x):$ $P_i$随机选$r\in Z_{2^l},$ 令$\langle x\rangle_i^A=x-r$，并发送r给$P_{1-i}$，$P_{1-i}$ 将$\langle x\rangle_{1-i}^{A}$ 设为r

### 3. Reconstruction: 
定义$Rec_i^A(x):$ $P_{1-i}$ 将$\langle x\rangle_{1-i}^A$给$P_{i}$，$P_i$计算$x=\langle x\rangle_0^A+\langle x\rangle_1^A$

## 2). Operations:

### 1. Addition 

需要计算$\langle z\rangle^A=\langle x\rangle^A+\langle y\rangle^A$，只需要$P_i$本地计算$\langle z\rangle_i^A=\langle x\rangle_i^A+\langle y\rangle_i^A$

### 2. Multiplication 

需要计算$\langle z\rangle^A=\langle x\rangle^A\langle y\rangle^A$

初始状态：

$A: \langle x\rangle^A_0,\langle y\rangle^A_0$

$B:\langle x\rangle^A_1,\langle y\rangle_1^A$

目标状态：

$A:\langle z\rangle^A_0$

$B:\langle z\rangle^A_1$

$s.t. \langle z\rangle^A_0+\langle z\rangle^A_1=\langle z\rangle_A=\langle x\rangle_A\times\langle y\rangle_A$

方案如下：

<ol>
<li>准备三元组$(a,b,c=a\times b)$ 然后将$(a,b,c=a\times b)$ 加法共享给$P_0,P_1$(具体方案会在之后介绍)
$A:\langle x\rangle_0^A,\langle y\rangle_0^A,\langle a\rangle^A_0,\langle b\rangle_0^A,\langle c\rangle_0^A$
$B:\langle x\rangle_1^A,\langle y\rangle_1^A,\langle a\rangle_1^A,\langle b\rangle_1^A,\langle c\rangle_1^A$</p></li>
<li><p>两方各自计算$\langle e\rangle^A_i=\langle x\rangle^A_i-\langle a\rangle^A_i,\langle f\rangle_i^A=\langle y\rangle^A_i-\langle b\rangle^A_i$（盲化$\langle x\rangle,\langle y\rangle$）
$A:\langle x\rangle_0^A,\langle y\rangle_0^A,\langle a\rangle^A_0,\langle b\rangle_0^A,\langle c\rangle_0^A,\langle e\rangle_0^A,\langle f\rangle_0^A$
$B:\langle x\rangle_1^A,\langle y\rangle_1^A,\langle a\rangle_1^A,\langle b\rangle_1^A,\langle c\rangle_1^A,\langle e\rangle^A_1,\langle f\rangle_1^A$</p></li>
<li><p>双方共享自己的$\langle e\rangle,\langle f\rangle$
$A:\langle x\rangle_0^A,\langle y\rangle_0^A,\langle a\rangle^A_0,\langle b\rangle_0^A,\langle c\rangle_0^A,\langle e\rangle^A,\langle f\rangle^A$
$B:\langle x\rangle_1^A,\langle y\rangle_1^A,\langle a\rangle_1^A,\langle b\rangle_1^A,\langle c\rangle_1^A,\langle e\rangle^A,\langle f\rangle^A$</p></li>
<li><p>计算$\langle z\rangle_0^A=f\times \langle a\rangle^A_0+e\times \langle b\rangle^A_0+\langle c\rangle_0^A$与$\langle z\rangle_1^A=e\times f+f\times \langle a\rangle^A_1+e\times\langle b\rangle^A_1+\langle c\rangle_1^A$
故有$\langle z\rangle^A+\langle z\rangle^B=e\times f+f\times a+e\times b+c=x\times y$</p></li>
</ol>

### 3. 生成三元组$(a,b,c=a\times b)$ 
#### (1). 通过同态加密实现 
<p>注释：Pailler同态加密指的是
$ Enc_0(a+b)=Enc_0(a) \times Enc_0(b)$
初始状态：$P_0,P_1$分别随机$\langle a\rangle_0^A,\langle a\rangle_1^A,\langle b\rangle_0^A,\langle b\rangle_1^A$，$P_1$随机一个随机数$r$
需要获得一个$\langle c\rangle^A,\langle c\rangle^A_1$，使得$\langle c\rangle_0^A+\langle c\rangle_1^A=\langle c\rangle^A=\langle a\rangle^A\langle b\rangle^A=(\langle a\rangle^A_0+\langle a\rangle^A_1)(\langle b\rangle_0^A+\langle b\rangle^A_1)$
方案如下：
1.$P_0$ 发送给 $P_1$:
$Enc_0(\langle a\rangle^A_0), Enc_0(\langle b\rangle^A_0)$
于是情况变为：
$P_0:\langle a\rangle^A_0,\langle b\rangle^A_0$
$P_1:\langle a\rangle^A_0,\langle b\rangle^A_1,r,Enc_0(\langle a\rangle^A_0),Enc_0(\langle b\rangle^A_0)$
2.$P_1$发给$P_0$:
$d=Enc_0(\langle a\rangle^A_0)^{\langle b\rangle^A_1}\times Enc_0(\langle b\rangle^A_0)^{\langle a\rangle^A_1}\times Enc_0(r)$
3.$P_0$计算$\langle c\rangle^A_0=\langle a\rangle^A_0 \langle b\rangle^A_0+Dec_0(d)=\langle a\rangle^A_0\langle b\rangle^A_0+\langle a\rangle^A_0\langle b\rangle^A_1+\langle a\rangle^A_1\langle b\rangle^A_0+r$
4.$P_1$计算
$\langle c\rangle^A_1=\langle a\rangle^A_1\langle b\rangle^A_1-r$

#### (2).通过OT实现 
暂时还不会 明天看！
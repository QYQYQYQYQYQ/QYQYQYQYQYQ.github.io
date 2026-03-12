---
title: "ABY - A Framework for efficient Mixed-Protocol Secure Two-Party Computation 阅读笔记 Part I"
date: 2026-02-24
categories: [学术, 安全计算]
tags: [安全多方计算, ABY]
---

# ABY - A Framework for efficient Mixed-Protocol Secure Two-Party Computation 阅读笔记 Part I

今天看了一下MPC的秘密共享框架ABY，主要看了Arithmetic部分，介绍了如何进行加法与乘法的计算，并介绍了如何用同态加密的方法以及不经意传输的方法生成Beaver三元组，但是OTBASE暂时没看懂，明天再看吧
<!--more-->

<h3>1). Share Semantics:</h3>
<h4>1. Shared values:</h4>
对于一个数$x$的l字节Arithmetic共享$\<x>^A$，我们有$\<x> ^A_0 + \<x>^A_1=\<x>^A , \<x>_0^A,\<x>_1^A\in Z_{2^l} $
<h4>2. Sharing:</h4>
定义$Shri^A_i(x):$ $P_i$随机选$r\in Z_{2^l},$ 令$\<x>_i^A=x-r$，并发送r给$P_{1-i}$，$P_{1-i}$ 将$\<x>_{1-i}^{A}$ 设为r
<h4>3. Reconstruction:</h4>
定义$Rec_i^A(x):$ $P_{1-i}$ 将$\<x>_{1-i}^A$给$P_{i}$，$P_i$计算$x=\<x>_0^A+\<x>_1^A$
<h3>2). Operations:</h3>
<h4>1. Addition</h4>
需要计算$\<z>^A=\<x>^A+\<y>^A$，只需要$P_i$本地计算$\<z>_i^A=\<x>_i^A+\<y>_i^A$
<h4>2. Multiplication</h4>
需要计算$\<z>^A=\<x>^A\<y>^A$
初始状态：
$A: \<x>^A_0,\<y>^A_0$
$B:\<x>^A_1,\<y>_1^A$
目标状态：
$A:\<z>^A_0$
$B:\<z>^A_1$
$s.t. \<z>^A_0+\<z>^A_1=\<z>_A=\<x>_A\times\<y>_A$
方案如下：
<ol>
<li>准备三元组$(a,b,c=a\times b)$ 然后将$(a,b,c=a\times b)$ 加法共享给$P_0,P_1$(具体方案会在之后介绍)
$A:\<x>_0^A,\<y>_0^A,\<a>^A_0,\<b>_0^A,\<c>_0^A$
$B:\<x>_1^A,\<y>_1^A,\<a>_1^A,\<b>_1^A,\<c>_1^A$</p></li>
<li><p>两方各自计算$\<e>^A_i=\<x>^A_i-\<a>^A_i,\<f>_i^A=\<y>^A_i-\<b>^A_i$（盲化$\<x>,\<y>$）
$A:<x>_0^A,<y>_0^A,<a>^A_0,<b>_0^A,<c>_0^A,<e>_0^A,<f>_0^A$
$B:\<x>_1^A,\<y>_1^A,\<a>_1^A,\<b>_1^A,\<c>_1^A,\<e>^A_1,\<f>_1^A$</p></li>
<li><p>双方共享自己的$<e>,<f>$
$A:\<x>_0^A,\<y>_0^A,\<a>^A_0,\<b>_0^A,\<c>_0^A,\<e>^A,\<f>^A$
$B:\<x>_1^A,\<y>_1^A,\<a>_1^A,\<b>_1^A,\<c>_1^A,\<e>^A,\<f>^A$</p></li>
<li><p>计算$\<z>_0^A=f\times \<a>^A_0+e\times \<b>^A_0+\<c>_0^A$与$\<z>_1^A=e\times f+f\times \<a>^A_1+e\times\<b>^A_1+\<c>_1^A$
故有$\<z>^A+\<z>^B=e\times f+f\times a+e\times b+c=x\times y$</p></li>
</ol>
<h4>3. 生成三元组 $(a,b,c=a\times b)$</h4>
<h5>(1). 通过同态加密实现</h5>
<p>注释：Pailler同态加密指的是$Enc_0(a+b)=Enc_0(a)\times Enc_0(b)$
初始状态：$P_0,P_1$分别随机$<a>_0^A,<a>_1^A,<b>_0^A,<b>_1^A$，$P_1$随机一个随机数$r$
需要获得一个$\<c>_0^A,\<c>^A_1$，使得$\<c>_0^A+\<c>_1^A=\<c>^A=\<a>^A\<b>^A=(\<a>^A_0+\<a>^A_1)(\<b>_0^A+\<b>^A_1)$
方案如下：
<ol>
<li>$P_0$发送给$P_1$: $Enc_0(\<a>_0^A), Enc_0(\<b>^A_0)$
$P_0:\<a>^A_0,\<b>^A_0$
$P_1:\<a>^A_0,\<b>^A_1,r,Enc_0(\<a>_0^A),Enc_0(\<b>_0^A)$</p></li>
<li><p>$P_1$发给$P_0$:
$d=Enc_0(\<a>_0^A)^{\<b>^A_1}\times Enc_0(\<b>_0^A)^{\<a>_1^A}\times Enc_0(r)$</p></li>
<li><p>$P_0$计算$\<c>_0^A=\<a>_0^A \<b>_0^A+Dec_0(d)=\<a>_0^A\<b>^A_0+\<a>_0^A\<b>^A_1+\<a>_1^A\<b>_0^A+r$</p></li>
<li><p>$P_1$计算
$\<c>_1^A=\<a>_1^A\<b>_1^A-r$</p></li>
</ol>
<h5>(2).通过OT实现</h5>
<p>暂时还不会 明天看！
---
title: "ROS: A GNN-based Relax-Optimize-and-Sample Framework for Max-k-Cut Problems"
collection: publications
category: conferences
permalink: /publication/2025-09-11-paper-title-number-5
excerpt: '**Yeqing Qiu**, Ye Xue, Akang Wang, Yiheng Wang, Qingjiang Shi, Zhi-Quan Luo'
date: 2025-09-11
venue: 'Forty-Second International Conference on Machine Learning'
paperurl: 'http://qyqyqyqyqyq.github.io/files/paper5.pdf'
---

**Abstract:** The Max-k-Cut problem is a fundamental combinatorial optimization challenge that generalizes the classic NP-complete Max-Cut problem. While relaxation techniques are commonly employed to tackle Max-k-Cut, they often lack guarantees of equivalence between the solutions of the original problem and its relaxation. To address this issue, we introduce the Relax-Optimize-and-Sample (ROS) framework. In particular, we begin by relaxing the discrete constraints to the continuous probability simplex form. Next, we pre-train and fine-tune a graph neural network model to efficiently optimize the relaxed problem. Subsequently, we propose a sampling-based construction algorithm to map the continuous solution back to a high-quality Max-k-Cut solution. By integrating geometric landscape analysis with statistical theory, we establish the consistency of function values between the continuous solution and its mapped counterpart. Extensive experimental results on random regular graphs, the Gset benchmark, and the real-world datasets demonstrate that the proposed ROS framework effectively scales to large instances with up to 20,000 nodes in just a few seconds, outperforming state-of-the-art algorithms. Furthermore, ROS exhibits strong generalization capabilities across both in-distribution and out-of-distribution instances, underscoring its effectiveness for large-scale optimization tasks.

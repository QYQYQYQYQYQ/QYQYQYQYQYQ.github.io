---
title: "Efficient learning of Scale-Adaptive Nearly Affine Invariant Networks"
collection: publications
category: manuscripts
permalink: /publication/2024-06-01-paper-title-number-2
excerpt: 'Equivariant Neural Networks, Computer Vision, Affine Equivariance'
date: 2024-06-01
venue: 'Neural Networks'
paperurl: 'http://qyqyqyqyqyq.github.io/files/paper2.pdf'
---

**Abstract:** Recent research has demonstrated the significance of incorporating invariance into neural networks. However, existing methods require direct sampling over the entire transformation set, notably computationally taxing for large groups like the affine group. In this study, we propose a more efficient approach by addressing the invariances of the subgroups within a larger group. For tackling affine invariance, we split it into the Euclidean group E(n) and uni-axial scaling group US(n), handling invariance individually.  We employ an E(n)-invariant model for E(n)-invariance and average model outputs over data augmented from a US(n) distribution for US(n)-invariance. Our method maintains a favorable computational complexity of O(N^2) in 2D and O(N^4) in 3D scenarios, in contrast to the O(N^6) (2D) and O(N^{12}) (3D) complexities of averaged models. Crucially, the scale range for augmentation adapts during training to avoid excessive scale invariance. This is the first time nearly exact affine invariance is incorporated into neural networks without directly sampling the entire group. Extensive experiments unequivocally confirm its superiority, achieving new state-of-the-art results in affNIST and SIM2MNIST classifications while consuming less than 15\% of inference time and fewer computational resources and model parameters compared to averaged models. 

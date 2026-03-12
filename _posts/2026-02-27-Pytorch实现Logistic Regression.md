---
title: "Pytorch实现Logistic Regression"
date: 2026-02-27
categories: [学术, 深度学习]
tags: [PyTorch, 深度学习]
---

# Pytorch实现Logistic Regression

将loss function改成$-(y\log\hat{y}+(1-y)\log(1-\hat {y})) $用以记录两个分布间的差异（二分类的交叉熵
<!--more-->

<h3>1. 加载数据集</h3>
<pre><code class="language-python line-numbers">import torchvision
train_set = torchvision.datasets.MNIST(root='../dataset/mnist', train = True, download = True)#download可以连接网络下载数据集，train表示是训练集还是测试集
test_set = torchvision.datasets.MNIST(root='../dataset/mnist',train = False,download = True)
import torchvision
train_set = torchvision.datasets.CIFAR10(…)
test_set = torchvision.datasets.CIFAR10(…)
</code></pre>
<h3>2.Logistic Regression 解决二分类问题</h3>
<pre><code class="language-python line-numbers">import torch.nn.functional as F
class LogisticRegressionModel(torch.nn.Module):
    def __init__(self):
        super(LogisticRegressionModel, self).__init__()
        self.linear = torch.nn.Linear(1, 1)
    def forward(self, x):
        y_pred = F.sigmoid(self.linear(x))#相比于Linear Unit，只是添加了一个sigma函数
        return y_pred
#cross-entropy ce
criterion = torch.nn.BCELoss(size_average = False)#size_average
#只有这两处变化，其余的都与linear不变
</code></pre>
<img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/01/wp_editor_md_92d4ebc120b4915c75fe53343bf6921d.jpg" alt="" />
<h3>解决单维输入数据二分类的完整代码：</h3>
<pre><code class="language-python line-numbers">#---------------------准备数据集--------------------------#
x_data = torch.Tensor([[1.0], [2.0], [3.0]])
y_data = torch.Tensor([[0], [0], [1]])
#----------------------设计模型---------------------------#
class LogisticRegressionModel(torch.nn.Module):
    def __init__(self):
        super(LogisticRegressionModel, self).__init__()
        self.linear = torch.nn.Linear(1, 1)
    def forward(self, x):
        y_pred = F.sigmoid(self.linear(x))
        return y_pred
model = LogisticRegressionModel()
#-------------------构建损失函数和优化器---------------------#
criterion = torch.nn.BCELoss(size_average=False)
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)
#------------------------迭代训练-------------------------#
for epoch in range(1000):
    y_pred = model(x_data)
    loss = criterion(y_pred, y_data)
    print(epoch, loss.item())
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
</code></pre>
<h3>3. 结果展示</h3>
<pre><code class="language-python line-numbers">import numpy as np
import matpolotlib.pyplot as plt
x = np.linspace(0, 10, 200)
x_t = torch.Tensor(x).view((200,1))
y_t = model(x_t)
y = y_t.data.numpy()
ply.plot(x, y)
plt.plot([0, 10], [0.5, 0.5], c='r')
plt.xlabel('Hours')
plt.ylabel('Probability of Pass')
plt.grid()
plt.show()
</code></pre>
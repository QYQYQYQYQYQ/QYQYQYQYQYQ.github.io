---
title: "PyTorch Implementation of Softmax Multi-Classifier"
date: 2026-02-28
categories: [学术, 深度学习]
tags: [PyTorch, 深度学习]
---

# PyTorch Implementation of Softmax Multi-Classifier

We hope the outputs is competitive! Actually we hope the neural network outputs a distribution.
<!--more-->
such that
$P(y=i)\ge 0 $
$\sum_{i=0}^{9}P(Y=i)=1$

<h3>Softmax Layer</h3>
$P(y = i)=\frac{e^{z_i}}{\sum_{j=0}^{K-1}e^{z_j}}, i\in{0,\cdots,K-1}$
<h3>Loss function - Cross Entropy</h3>
$Loss(\hat{Y},Y)=-Y\log \hat Y$
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/02/wp_editor_md_f53fa6e8dbbe950ea37c756dbf9099de.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/02/wp_editor_md_f53fa6e8dbbe950ea37c756dbf9099de.jpg" alt="" /></a>
<pre><code class="language-python line-numbers"># Cross Entropy in numpy
import numpy as np
y = np.array([1, 0, 0])
z = np.array([0.2, 0.1, -0.1])
y_pred = np.exp(z) / np.exp(z).sum()
loss = (- y * np.log(y_pred)).sum()
print(loss)
# Cross Entropy in PyTorch
import torch
y = torch.LongTensor([0])
z = torch.Tensor([[0.2, 0.1, -0.1]])
criterion = torch.nn.CrossEntropyLoss()
loss = criterion(z, y)
print(loss)
#Mini-Batch: batch_size = 3
import torch
criterion = torch.nn.CrossEntropyLoss()
Y = torch.LongTensor([2, 0, 1])
Y_pred1 = torch.Tensor([[0.1, 0.2, 0.9],
                        [1.1, 0.1, 0.2],
                        [0.2, 2.1, 0.1]])
Y_pred2 = torch.Tensor([[0.8, 0.2, 0.3],
                        [0.2, 0.3, 0.5],
                        [0.2, 0.2, 0.5]])
l1 = criterion(Y_pred1, Y)
l2 = criterion(Y_pred2, Y)
print("Batch Loss1 = ", l1.data, "\nBatch Loss2 = ", l2.data)
</code></pre>
<h3>MNIST dataset</h3>
<strong>step 0: Import Package</strong>
<pre><code class="language-python line-numbers">import torch
from torchvision import transforms
from torchvision import datasets
from torch.utils.data import DataLoader
# For constructing DataLoader
import torch.nn.functional as F
# For using function relu()
import torch.optim as optim
# For constructing Optimizer
</code></pre>
<strong>step 1: Prepare Dataset</strong>
<pre><code class="language-python line-numbers">batch_size = 64
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.1307,), (0.3081,))
    # The parameters are mean and std respectively.makes it to a 0-1 distribution
])
# Transform is to convert the PIL Image to Tensor
</code></pre>
$PIL\ Image:Z^{28\times28},pixel\in{0,\cdots,255}\Rightarrow PyTorch Tensor :R^{1\times28\times28},pixel\in[0,1]$
$pixel_{norm}=\frac{Pixel_{origin}-mean}{std}$
<pre><code class="language-python line-numbers">train_dataset = datasets.MNIST(root='..\dataset\mnist',
                               train=True,
                               download=True,
                               transform=transform)
train_loader = DataLoader(train_dataset,
                          shuffle=True,
                          batch_size=batch_size)
test_dataset = datasets.MNIST(root='..\dataset\mnist',
                              train=False,
                              download=True,
                              transform=transform)
test_loader = DataLoader(test_dataset,
                         shuffle=False,
                         batch_size=batch_size)
</code></pre>
<strong>step 2: Design Model</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/02/wp_editor_md_e102b7731cdbb42d07d852d299dcbda2.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/02/wp_editor_md_e102b7731cdbb42d07d852d299dcbda2.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">class Net(torch.nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.l1 = torch.nn.Linear(784, 512)
        self.l2 = torch.nn.Linear(512, 256)
        self.l3 = torch.nn.Linear(256, 128)
        self.l4 = torch.nn.Linear(128, 64)
        self.l5 = torch.nn.Linear(64, 10)
    def forward(self, x):
        x = x.view(-1, 784)
        x = F.relu(self.l1(x))
        x = F.relu(self.l2(x))
        x = F.relu(self.l3(x))
        x = F.relu(self.l4(x))
        return self.l5(x)
# DO NOT activate at the last step, because Torch.nn.CrossEntropyLoss includes relu function
</code></pre>
<strong>step 3: Construct Loss and Optimizer</strong>
<pre><code class="language-python line-numbers">model = Net()
criterion = torch.nn.CrossEntropyLoss()
optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.5)
</code></pre>
<strong>step 4: Train and Test</strong>
<pre><code class="language-python line-numbers">def train(epoch):
    running_loss = 0.0
    for batch_idx, data in enumerate(train_loader, 0):
        inputs, target = data
        optimizer.zero_grad()
        # forward + backward + update
        outputs = model(inputs)
        loss = criterion(outputs, target)
        loss.backward()
        optimizer.step()
        running_loss += loss.item()
    if batch_idx % 300 == 299:
        print('%d %d loss: %.3f' % (epoch + 1, batch_idx + 1, running_loss / 300))
        running_loss = 0.0
def test():
    correct = 0
    total = 0
    with torch.no_grad():  # the code below will not calculate gradient
        for data in test_loader:
            images, labels = data
            outputs = model(images)
            _, predicted = torch.max(outputs.data, dim=1)
            # dim=0/1 refer to line/column dimension
            # '_' refers to maximum and 'predicted' refers to index of the maximum number
            total += labels.size(0)
            # label.size -> n*1
            correct += (predicted == labels).sum().item()
    print('Accuracy on test set: %d %%' % (100 * correct / total))
if __name__ == '__main__':
    for epoch in range(10):
        train(epoch)
        test()
</code></pre>
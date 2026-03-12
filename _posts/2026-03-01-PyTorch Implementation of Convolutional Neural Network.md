---
title: "PyTorch Implementation of Convolutional Neural Network"
date: 2026-03-01
categories: [学术, 深度学习]
tags: [PyTorch, 深度学习]
---

# PyTorch Implementation of Convolutional Neural Network

This passage is to solve MNIST problem using CNN,  Residual Net and Inception Module.
<!--more-->
<strong>1. Convolutional Layer</strong>

<pre><code class="language-python line-numbers">import torch
in_channels, out_channels = 5, 10
width, height = 100, 100  # imgae size
kernel_size = 3
batch_size = 1
input = torch.randn(batch_size, in_channels, width, height)
conv_layer = torch.nn.Conv2d(in_channels, out_channels, kernel_size=kernel_size)
output = conv_layer(input)
print(input.shape)
print(output.shape)
print(conv_layer.weight.shape)
</code></pre>
<strong>2. Convolutional Layer - padding = 1</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_4a1e7db540ab8ab9d007d8c7aca8ef84.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_4a1e7db540ab8ab9d007d8c7aca8ef84.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">import torch
input = [3, 4, 5, 6, 7,
         2, 4, 6, 8, 2,
         1, 6, 7, 8, 4,
         9, 7, 4, 6, 2,
         3, 7, 5, 4, 1]
input = torch.Tensor(input).view(1, 1, 5, 5)
# view(Batch_number, input_Channel, width, height)
conv_layer = torch.nn.Conv2d(1, 1, kernel_size=3, padding=1, bias=False)
# torch.nn.Conv2d(input_channel, output_channel, kernel_size(3x3), padding, bias)
kernel = torch.Tensor([1, 2, 3, 4, 5, 6, 7, 8, 9]).view(1, 1, 3, 3)
# view is like reshape
conv_layer.weight.data = kernel.data
# kernel is a tensor. use kernel.data
# edit conv_layer.weight to change the kernel
output = conv_layer(input)
print(output)
</code></pre>
<strong>3. Convolutional Layer - stride = 2</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_33bc1ace16cacc7a0b3072fc83e89adc.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_33bc1ace16cacc7a0b3072fc83e89adc.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">import torch
input = [3, 4, 5, 6, 7,
         2, 4, 6, 8, 2,
         1, 6, 7, 8, 4,
         9, 7, 4, 6, 2,
         3, 7, 5, 4, 1]
input = torch.Tensor(input).view(1, 1, 5, 5)
conv_layer = torch.nn.Conv2d(1, 1, kernel_size=3, stride=2, bias=False)
output = conv_layer(input)
print(output)
</code></pre>
<strong>4. Max pooling layer</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_19b1d086733b88b377c4296876d23ad5.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_19b1d086733b88b377c4296876d23ad5.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">import torch
input = [3, 4, 6, 5,
         2, 4, 6, 8,
         1, 6, 7, 8,
         9, 7, 4, 6,
         ]
input = torch.Tensor(input).view(1, 1, 4, 4)
maxpooling_layer = torch.nn.MaxPool2d(kernel_size=2)
output = maxpooling_layer(input)
print(output)
</code></pre>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_3312fe36804a653a0f05b3c82fcc5ecf.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_3312fe36804a653a0f05b3c82fcc5ecf.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">class Net(torch.nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = torch.nn.Conv2d(1, 10, kernel_size = 5)
        self.conv2 = torch.nn.Conv2d(10 ,20, kernel_size = 5)
        self.pooling = torch.nn.MaxPool2d(2)
        self.fc = torch.nn.Linear(320, 10)
    def forward(self, x):
        # Flatten data from (n, 1, 28, 28) to (n, 784)
        batch_size = x.size(0)
        # x.size == (n, 1, 28, 28) ==> x.size(0) == n
        x = F.relu(self.pooling(self.conv1(x)))
        x = F.relu(self.pooling(self.conv2(x)))
        x = x.view(batch_size, -1)# flatten
        x = self.fc(x)
        return x
model = Net()
#if wanna use gpu-----------------------
device = torch.device("cuda:0"if torch.cuda.is_available() else "cpu")
model.to(device)
#---------------------------------------
def train(epoch):
    running_loss = 0.0
    for batch_idx, data in enumerate(train_loader, 0):
        inputs, target = data
        inputs, target = inputs.to(device), target.to(device)
        # send the inputs and targets at every step to the GPU
        optimizer.zero_grad()
        # forward + backward + update
        outputs = model(inputs)
        loss = criterion(outputs, target)
        loss.backward()
        optimizer.step()
        running_loss +=loss.item()
        if batch_idx % 300 == 299:
            print('[%d %5d] loss:%.3f' % (epoch+1, batch_idx +1, running_loss / 2000))
            running_loss = 0.0
def test():
    correct = 0
    total = 0
    with torch.no_grad():
        for data in test_loader:
            inputs, target = data
            inputs, target = inputs.to(device), target.to(device)
            outputs = model(inputs)
            _, predicted = torch.max(outputs.data, dim = 1)
            total += target.size(0)
            correct += (predicted == target).sum().item()
        print('Accuracy on test set: %d %% [%d/%d]' % (100 * correct / total, correct, total))
</code></pre>
<strong>Inception Module:</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_690132e6934b5b51e12afc789e17b94b.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_690132e6934b5b51e12afc789e17b94b.jpg" alt="" /></a>
we can use class to decrease programming tasks.
<strong>Inception:</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_ca3f3beb442c56d8ead99ccb472c9fb7.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_ca3f3beb442c56d8ead99ccb472c9fb7.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">class InceptionA(torch.nn.Module):
    def __init__(self, in_channels):
        super(InceptionA, self).__init__()
        self.branch1x1 = torch.nn.Conv2d(in_channels, 16, kernel_size=1)
        self.branch5x5_1 = torch.nn.Conv2d(in_channels, 16, kernel_size=1)
        self.branch5x5_2 = torch.nn.Conv2d(16, 24, kernel_size=5, padding=2)
        self.branch3x3_1 = torch.nn.Conv2d(in_channels, 16, kernel_size=1)
        self.branch3x3_2 = torch.nn.Conv2d(16, 24, kernel_size=3, padding=1)
        self.branch3x3_3 = torch.nn.Conv2d(24, 24, kernel_size=3, padding=1)
        self.branch_pool = torch.nn.Conv2d(in_channels, 24, kernel_size=1)
    def forward(self, x):
        branch1x1 = self.branch1x1(x)
        branch5x5 = self.branch5x5_1(x)
        branch5x5 = self.branch5x5_2(branch5x5)
        branch3x3 = self.branch3x3_1(x)
        branch3x3 = self.branch3x3_2(branch3x3)
        branch3x3 = self.branch3x3_3(branch3x3)
        branch_pool = F.avg_pool2d(x, kernel_size=3, stride=1, padding=1)
        branch_pool = self.branch_pool(branch_pool)
        outputs = [branch1x1, branch5x5, branch3x3, branch_pool]
        return torch.cat(outputs, dim=1)
class Net(torch.nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = torch.nn.Conv2d(1, 10, kernel_size=5)
        self.conv2 = torch.nn.Conv2d(88, 20, kernel_size=5)
        # 88 = 24 + 24 + 24 + 16
        self.incep1 = InceptionA(in_channels=10)
        self.incep2 = InceptionA(in_channels=20)
        self.mp = torch.nn.MaxPool2d(2)
        self.fc = torch.nn.Linear(1408, 10)
    def forward(self, x):
        in_size = x.size(0)
        x = F.relu(self.mp(self.conv1(x)))
        x = self.incep1(x)
        x = F.relu(self.mp(self.conv2(x)))
        x = self.incep2(x)
        x = x.view(in_size, -1)
        x = self.fc(x)
        return x
</code></pre>
<strong>Residual net:</strong>
<a class="wp-editor-md-post-content-link" href="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_8cac13d0194cb70cbb1277147cc082f7.jpg"><img src="https://qyqyqyqyqyq.top/wp-content/uploads/2021/03/wp_editor_md_8cac13d0194cb70cbb1277147cc082f7.jpg" alt="" /></a>
<pre><code class="language-python line-numbers">class ResidualBlock(torch.nn.Module):
    def __init__(self, channels):
        super(ResidualBlock, self).__init__()
        self.channels = channels
        self.conv1 = torch.nn.Conv2d(channels, channels,
                                     kernel_size=3, padding=1)
        self.conv2 = torch.nn.Conv2d(channels, channels,
                               kernel_size=3, padding=1)
    def forward(self, x):
        y = F.relu(self.conv1(x))
        y = self.conv2(y)
        return F.relu(x + y)
class Net(torch.nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = torch.nn.Conv2d(1, 16, kernel_size=5)
        self.conv2 = torch.nn.Conv2d(16, 32, kernel_size=5)
        self.mp = torch.nn.MaxPool2d(2)
        self.rblock1 = ResidualBlock(16)
        self.rblock2 = ResidualBlock(32)
        self.fc = torch.nn.Linear(512, 10)
    def forward(self, x):
        in_size = x.size(0)
        x = self.mp(F.relu(self.conv1(x)))
        x = self.rblock1(x)
        x = self.mp(F.relu(self.conv2(x)))
        x = self.rblock2(x)
        x = x.view(in_size, -1)
        x = self.fc(x)
        return x
</code></pre>
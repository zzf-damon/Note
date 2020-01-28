# Don't repeat yourself

- 定义输出输入数据

- 定义一个模型

- 定义一个loss function

- 把这个模型交给optimizer来做优化

- 进入一个训练过程,用训练的数据来预测想要的数据,然后拿预测的数据取与真的数据取计算一个loss

- 得到这个loss以后做backward,然后optimizer进行优化

batch 小批,在训练数据时,数据量会很大,就需要分批

神经网络预测器:Neu

1. 构建网络模型
2. 建立损失函数和优化器
3. 对神经网络进行分批次的训练

+ ```python
  neu = torch.nnSequential(
  torch.nnLinear(input_size.hidden_size),
  torch.nn.Sigmoid(),
  torch.nnLinear(hidden_size,output_size),
  )
  ```

  

#### 首先定义一个optimizer

#### 计算准确率的heapler函数

#### Crossentropy  计算损失函数

#### loss.backward() 反向传播

#### 最后拿到一个linear ，需==要做一==个somiod



CNN  把一个局部的特征提取出来，然后不断地移动

dropout  对于文本分类很重要


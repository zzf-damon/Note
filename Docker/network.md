```bash
sudo ip netns list 查看本地 的network
sudo ip netns add blue  添加 delete 删除
sudo ip netns exec blue ip a   查看blue的接口
sudo ip netns exec blue ip link set dev lo up  改变blue的状态
sudo ip link add blue-veth-a type veth peer name blue-veth-b   创建一个link
sudo ip link set blue-veth-b netns blue 将link移动到blue里面
sudo ip netns exec blue ip link  查看是否放入blue
sudo ip addr add 192.168.1.1/24 dev blue-veth-a   给blue-veth-a添加地址
sudo ip netns exec blue ip addr add 192.168.1.2/24 dev blue-veth-b   给blue添加地址
 sudo ip netns exec blue ip link  查看操作是否成功
```

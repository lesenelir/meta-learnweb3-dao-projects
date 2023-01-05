# Solidity by Example

**03-原始数据类型**

- boolean
- uint
- int
- address



**04-变量**

- state变量
  - 声明在函数外部
  - 数据保存在链上
- local变量
  - 声明在函数内容
  - 数据不保存在链上
- global变量
  - 提供区块链信息



**04-constant常数修饰符**

- constant 修饰变量，该变量不能被重新修改



**05-immutable-不变修饰符**

- 修饰的state变量只可以在构造函数中修改



**06-读写state变量**

- 发起交易 === 调用合约中的函数

- 修改合约中state变量需要transaction交易手续费
- 读取合约中state变量，不需要交易手续费



**07-ether & Wei**

- ether 和 Wei 都是交易的媒介，一种计量单位
- 1 wei == 1
- 1 ether == 10^18 wei



**08-gas**

- gas 是一个计算单位（动态变化）

- gas price 是发送方期望支付的gas值（计算单位）

  - >gas price 高的交易，更有优先权被纳入block中。
    >
    >交易时是以当前的gas费作为交易，如果当前的交易gas price 高于gas，则退回多余gas费

- gas spent 是一次交易中花费了多少个gas

  - > 一次交易支付的价钱：gas price * gas spent

- gas limit 发送方发送交易需要支付多少个gas，由发送方决定
- block gas limit 区块中最大允许的gas，由network决定



# 官网链接
https://arthas.aliyun.com/
# 部署
## 重点关注 service - client
[service - client模式](https://arthas.aliyun.com/doc/tunnel.html#%E5%90%AF%E5%8A%A8-arthas-%E6%97%B6%E8%BF%9E%E6%8E%A5%E5%88%B0-tunnel-server)
这个
# 重点命令
## jvm 相关
    - dashboardd
    - thread 当前线程状态
    - jvm 
## classloader 相关
    - sc 搜索类的详细信息，包括类加载器，研究双亲委派机制时候非常管用。找jvm中的类
    - sm 搜索类的相关方法 常用
    - jad - 反编译，非常常用
    - mc, redefine
    - classloader - 统计类的加载情况
## monitor/watch/trace 相关
    - monitor - 可以监控任一类的方法执行频率、失败成功等。
    - watch - 非常好用，类似idea中的变量观察
    - trace - 
    - stack
    - tt
## 其他
几个关于 Flink 与 JVM 相关的问题
1. standalone 中，用户A和用户B上传的 Jar 包如果包含不同的版本依赖，比如Kafka 1.x 与 Kafka 2.x
那么当分发到同一个 TaskManager（同一个JVM） 中时候，它的类加载机制会同时加载两个类吗？
# 记录 Guava 的学习过程
## 参考材料

主要参考B站上的[视频](https://www.bilibili.com/video/BV1R4411s7GX/?spm_id_from=333.788.top_right_bar_window_default_collection.content.click&vd_source=3fca7111758d8e59eace32a88534e442)
讲师是[汪文君](https://book.douban.com/subject_search?search_text=%E6%B1%AA%E6%96%87%E5%90%9B)，讲课风格一般，但是这门课程 Guava 由浅入深，还是能入手看的。
源码在 [GitHub](https://github.com/wangwenjun/guava_programming)。
谷歌官方的 wiki 连接[guava](https://github.com/google/guava/wiki)
## 大纲

## 知识图谱
等到完成这部分代码之后，一定将知识图谱整理到 XMind 文档中。

## 学习方法：
1. 15个小时，搞懂 guava 的产品设计。参考 汪文君 的课程先构建起整个课程脉络，把 guava 的 api 用好，然后绘制的一部分知识图谱，也就是用好 guava
2. 15个小时，回顾之前学习的设计模式，画知识图谱总结“如何设计好一个 java 核心库的关键点”：哪些 api 最常用，如何联系起这些 api，对比 apache common 和 hutool 有哪些共同点。
3. 6个小时，只用 guava 写一个小 demo，比如用很小的内存处理一个大文件，等等。
4. 把 guava 用熟悉之后，快速过一下 apache common 和 hutool，进一步总结 “如何设计好一个 java 核心库的关键点”，反思目前工作中其他同事用hutool主要是在做什么。
5. 有了这些基本类，在看 hadoop、flink 等大数据组件的源码会更熟悉一点。
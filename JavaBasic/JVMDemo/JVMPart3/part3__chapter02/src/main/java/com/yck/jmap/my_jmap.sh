# https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jmap.html
# 获取 dump 文件、观测堆内存信息、堆中对象、类加载信息。

jmap -help
# option 有 -dump  -heap -clstats -hist

# 1. -dump 导出内存映像文件
## 手动导出
jmap -dump:format=b,file=E://JVM//com.yck.AddStringData_jmap_dump.hprof 11220
## 自动导出,当OOM时候导出hprof文件 两个很重要的参数: -XX:HeapDumpPath -XX:+HeapDumpOnOutOfMemoryError
java -jar xxx.jar  -XX:HeapDumpPath=E://JVM//com.yck.AddByteData.hprof -XX:+HeapDumpOnOutOfMemoryError
##----------------------------------------------------------------------------------------
# 2. -heap 查看 heap 各个代的空间使用情况
jmap -heap 89988 >> AddStringData_jmap_heap.log
##----------------------------------------------------------------------------------------
# 3. !重要! -histo histolive 按照类来查看实例的个数以及容量 \类的个数
jmap -histo 89988 >> AddStringData_jmap_histo.log
jmap -histo:live 89988 >> AddStringData_jmap_histolive.log
# 我还关注了 Flink 的taskmanager进程在加载多个Flink任务时候的类加载情况
# 详情查看  flink_taskmanager_jmap_histo_live.log  这些日志
# 结论: Flink中每加载一个
# 关于日志中类名带有 $1 $$2 的说明:
# 日志中有 com.github.yck.simpletask.StatelessTask$1,com.github.yck.simpletask.StatelessTask$2
# 这应该是因为这个 StatelessTask$1 任务中有两个算子(source和(keyby+sum+print)),所以以匿名内部类的形式表示.
# https://forums.oracle.com/ords/apexds/post/1-class-files-5982
# 另外通过比较 flink_taskmanager_jmap_histo_live.log 这些日志,我发现只要改变某个类的代码,它就会重新上传
# 新的class.
##----------------------------------------------------------------------------------------
# 4. -finalizerinfo 不太重要
jmap -finalizerinfo 89988


# -clstats
jmap -clstats 89988 >> AddStringData_jmap_clstats.log
##
# 通过观测 flink_taskmanager_jmap_clstats_1.log 发现
# 每发布一个类的新版本,都会有 FlinkUserCodeClassLoaders$ParentFirstClassLoader
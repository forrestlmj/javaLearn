# 指令的官方文档见：https://docs.oracle.com/javase/8/docs/technotes/tools/windows/jstat.html
# 1、类加载相关
jstat -class -t -h5 68132 1s 100
jstat -gcmetacapacity: Displays statistics about the sizes of the metaspace.



# 2、垃圾回收相关
jstat -gc -t -h5 PID 1s 100 >> AddByteData_jvm.log
# 查看 gc的具体信息
jstat -gc -t -h5 PID 1s 100 >> AddByteData_jstat_gc.log
# 查看 每个区的最大容量
jstat -gccapacity -t -h5 PID 1s 100 >> AddByteData_jvm_gccapacity.log
# 查看 按照比例 查看堆区的比例
jstat -gcutil -t -h5 44472 1s 100 >> AddByteData_jvm_gcutil.log
#

# 参数说明
# Usage: jstat -help|-options
#       jstat -<option> [-t]（时间戳） [-h<lines>]几行打印标题 <vmid> [<interval> 间隔毫秒 [<count> 次]]
#       <option> 有以下选项 gc 查看 gc 的信息


/**
 *
 * MAT 中主要的几个功能：
 * 1. dump 文件（命令行导出与 MAT 导入）
 * 2. 查看直方图
 * 3. 查看支配树
 *  3.1 深堆
 *      - 保留集
 *  3.2 浅堆
 * 4. 从线程角度中的局部变量表查看变量。
 *  4.1 这里看到的就是实际的变量大小。
 * 5. OQL
 * 6. 检测内存泄漏、死锁等。
 * 见 {@link com.yck.test.AddStringDataToDifferentList}
 */
package com.yck.mat;
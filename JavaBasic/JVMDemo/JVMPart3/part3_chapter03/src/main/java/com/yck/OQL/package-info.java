/**
 * OQL 其实在 MAT 中还挺好用的，里面支持 select from where 子查询 等语法
 * 要重点注意 MAT 中看到的实例变脸如何去查询，
 * 1、比如 java.util.ArrayList 的 elementData，可以通过 select * from java.util.ArrayList a where
 * a.elementData.@length > 10
 * 中的 where 语义来查看长度大于 10 的 List，还有 MAT 自带的 instanceof, objects, classof() 等函数。
 * 2、HashMap 中被 transient 的实例变量其实是看不见的，
 */
package com.yck.OQL;
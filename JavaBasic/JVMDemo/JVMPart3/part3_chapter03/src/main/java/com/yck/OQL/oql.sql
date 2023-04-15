select * from java.util.Vector;
select objects v.elementData from java.util.Vector v;
select objects v.value from java.util.Vector v;

SELECT s.value.@length, s.value, toString(s) FROM java.lang.String s WHERE (toString(s) LIKE ".*my.*")
select as retained set * from java.lang.String s;
SELECT DISTINCT classof(s) FROM java.lang.String s

-- where clause
select * from char[] s where s.@length > 10
-- 子查询
SELECT c.table FROM OBJECTS ( SELECT * FROM java.util.HashMap s WHERE (s.table != null) ) c

SELECT a.elementData, a, toHex(a.@objectAddress) FROM java.util.ArrayList a WHERE (a.elementData.@length > 20)
SELECT * FROM java.util.ArrayList a WHERE (a.elementData.@length > 20)
-- 这里 a.value 就是String中的私有实例变量，在堆空间中能看见，MAT中
-- select * from java.lang.String 时候也能看到。@length 指数组的长度，String的数组是char[]
-- ArrayList 是Object[]，所以@length都可以用
SELECT * FROM java.lang.String a where a.value.@length > 100

SELECT toHex(m.@objectAddress), m.size,
       m.table.@length, m.@retainedHeapSize
FROM java.util.HashMap m
select * from com.yck.test.MemoryLick
-- The@
--  symbol denotes fields and methods
-- (from the Java API) like objectAddress,
-- usedHeapSize, retainedHeapSize, GCRootInfo
-- and length (for arrays). Functions like toHex(),
-- toString(), classof(), dominatorof() etc. allow
-- simple transformations.
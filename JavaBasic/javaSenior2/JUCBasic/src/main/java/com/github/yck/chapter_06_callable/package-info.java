/**
 * <p>
 * 本章主要讲除了实现 {@link java.lang.Runnable} 与 继承 {@link java.lang.Thread}
 * 外创建线程的第三种方法：实现{@link java.util.concurrent.Callable}方法。
 * </p>
 *
 *
 * <p>
 * 但是此方法必须结合 {@link java.util.concurrent.FutureTask} 进行使用。
 * 详情见:
 * @see com.github.yck.chapter_06_callable.futuretask.FutureTaskTest FutureTaskTest
 * </p>
 */
package com.github.yck.chapter_06_callable;
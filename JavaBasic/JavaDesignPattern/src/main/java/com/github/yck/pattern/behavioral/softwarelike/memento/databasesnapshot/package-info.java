package com.github.yck.pattern.behavioral.softwarelike.memento.databasesnapshot;

/**
 * 自己做的一个例子
 *
 * 观察者模式 + 备忘录模式
 *
 * 客户端：
 *
 *
 * SnapShot（Memento）
 *
 *  备份数据：
 *
 * SnapShotManager（Observer + MementoManager）:
 *  保存N份全量快照
 *
 * DBFile（Subject + Originator）:
 *  当修改属性，自动通知 Manager 备份
 *
 *
 *
 */
package com.github.yck.pattern.behavioral.statefulbehaivor.responsibilitychain;
/**
 * 责任链模式
 * 比较直观，就是针对请求，按照 链式进行处理
 * 类似于 报销审批、流程审批、请求处理等
 * 核心概念
 *  1、将请求的发送端与接收端解耦，使用一个链表对请求轮番处理
 *  2、如果链表上的节点无法处理请求，那么交给下一个节点
 */
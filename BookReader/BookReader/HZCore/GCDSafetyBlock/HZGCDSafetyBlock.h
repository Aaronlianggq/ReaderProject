//
//  HZGCDSafetyBlock.h
//  BookReader
//
//  Created by lianggq on 2018/3/19.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  安全的同步执行队列, 减少队列死锁的可能
 *
 *  @param queue 队列
 *  @param tag   队列标识
 *  @param block 要执行的块
 */
OBJC_EXPORT void dispatch_sync_safe(dispatch_queue_t queue, const void *tag, dispatch_block_t block);

/**
 *  安全的异步执行队列, 减少队列死锁的可能性
 *
 *  @param queue 队列
 *  @param tag   队列标识
 *  @param block 要执行的块
 */
OBJC_EXPORT void dispatch_async_safe(dispatch_queue_t queue, const void *tag, dispatch_block_t block);

/**
 *  异步转主线程
 *
 *  @param globalBlock 异步线程
 *  @param mainBlock   主线程
 */
OBJC_EXPORT void dispatch_global_main(dispatch_block_t globalBlock, dispatch_block_t mainBlock);

/**
 *  异步全局线程
 *
 *  @param globalBlock 异步线程
 */
OBJC_EXPORT void global_thread(dispatch_block_t globalBlock);

/**
 *  转主线程
 *
 *  @param mainBlock   异步主线程
 */
OBJC_EXPORT void main_async_thread(dispatch_block_t mainBlock);

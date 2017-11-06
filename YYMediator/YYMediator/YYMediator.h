//
//  YYMediator.h
//  YYMediator
//
//  Created by Blavtes on 17/11/06.
//  Copyright © 2017年 Blavtes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYMediator : NSObject

+ (instancetype)sharedInstance;

// 远程App调用入口
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;
// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end

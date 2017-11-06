//
//  YYMediator+YYMediatorModuleAActions.m
//  YYMediator
//
//  Created by Blavtes on 17/11/06.
//  Copyright © 2017年 Blavtes. All rights reserved.
//

#import "YYMediator+YYMediatorModuleAActions.h"

NSString * const kYYMediatorTargetA = @"A";

NSString * const kYYMediatorActionNativFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kYYMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kYYMediatorActionNativeNoImage = @"nativeNoImage";
NSString * const kYYMediatorActionShowAlert = @"showAlert";
NSString * const kYYMediatorActionCell = @"cell";
NSString * const kYYMediatorActionConfigCell = @"configCell";

@implementation YYMediator (YYMediatorModuleAActions)

- (UIViewController *)YYMediator_viewControllerForDetail
{
    UIViewController *viewController = [self performTarget:kYYMediatorTargetA
                                                    action:kYYMediatorActionNativFetchDetailViewController
                                                    params:@{@"key":@"value"}
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)YYMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kYYMediatorTargetA
                     action:kYYMediatorActionNativePresentImage
                     params:@{@"image":image}
          shouldCacheTarget:NO];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kYYMediatorTargetA
                     action:kYYMediatorActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"noImage"]}
          shouldCacheTarget:NO];
    }
}

- (void)YYMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kYYMediatorTargetA
                 action:kYYMediatorActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

- (UITableViewCell *)YYMediator_tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    return [self performTarget:kYYMediatorTargetA
                        action:kYYMediatorActionCell
                        params:@{
                                 @"identifier":identifier,
                                 @"tableView":tableView
                                 }
             shouldCacheTarget:YES];
}

- (void)YYMediator_configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    [self performTarget:kYYMediatorTargetA
                 action:kYYMediatorActionConfigCell
                 params:@{
                          @"cell":cell,
                          @"title":title,
                          @"indexPath":indexPath
                          }
      shouldCacheTarget:YES];
}

- (void)YYMediator_cleanTableViewCellTarget
{
    [self releaseCachedTargetWithTargetName:kYYMediatorTargetA];
}

@end

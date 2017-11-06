//
//  YYMediator+YYMediatorModuleAActions.h
//  YYMediator
//
//  Created by Blavtes on 17/11/06.
//  Copyright © 2017年 Blavtes. All rights reserved.
//

#import "YYMediator.h"
#import <UIKit/UIKit.h>

@interface YYMediator (YYMediatorModuleAActions)

- (UIViewController *)YYMediator_viewControllerForDetail;

- (void)YYMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (void)YYMediator_presentImage:(UIImage *)image;

- (UITableViewCell *)YYMediator_tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView;

- (void)YYMediator_configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath;

- (void)YYMediator_cleanTableViewCellTarget;

@end

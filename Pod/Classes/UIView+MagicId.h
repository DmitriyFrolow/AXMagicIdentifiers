//
//  UIView+MagicId.h
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import <UIKit/UIKit.h>

@interface UIView (MagicId)

- (UIViewController *)ax_ViewController;

- (NSString *)ax_prefix;

- (void)ax_addAccId;

@end

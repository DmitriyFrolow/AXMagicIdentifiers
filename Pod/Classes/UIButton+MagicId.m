//
//  UIButton+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIButton+MagicId.h"
#import "UIView+MagicId.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation UIButton (MagicId)

+ (void)load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(setTitle:forState:)
                     withMethod:@selector(ax_setTitle:forState:) error:nil];
    });
}


#pragma mark - Method Swizzling

- (void)ax_setTitle:(NSString *)title forState:(UIControlState)state
{
    [self ax_setTitle:title forState:state];
    [self performSelector:@selector(ax_addAccId) withObject:nil afterDelay:0.5];
}


#pragma mark - Public Utils

- (void)ax_addAccId
{
    
    if (!self.accessibilityLabel.length || [self.accessibilityIdentifier hasPrefix:@"AX_"]) {
        NSString *title = self.titleLabel.text;
        
        if (!title)
        {
            UIWindow* window = [UIApplication sharedApplication].keyWindow;
            CGPoint point = [[self superview] convertPoint:self.frame.origin toView:window];
            title = NSStringFromCGPoint(point);
        }
        title = [title stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        if (!self.accessibilityIdentifier)
        {
            self.accessibilityIdentifier =
            [@"" stringByAppendingFormat:@"%@_BUTTON_%@",self.ax_prefix,title];
        }
        
        if (!self.accessibilityLabel)
        {
            self.accessibilityLabel =
            [@"" stringByAppendingFormat:@"%@_BUTTON_%@",self.ax_prefix,title];
        }
    }
}

@end

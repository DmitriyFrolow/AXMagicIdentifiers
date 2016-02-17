//
//  UITextView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UITextView+MagicId.h"
#import "UIViewController+MagicId.h"
#import "UIView+MagicId.h"

@implementation UITextView (MagicId)

#pragma mark - Public Utils

- (void)ax_addAccId
{
    if (!self.accessibilityIdentifier || !self.accessibilityLabel)
    {
        if (!self.accessibilityIdentifier)
        {
            NSString *tag = [self ax_accessibilityIdentifierTag];
            self.accessibilityIdentifier =
            [@"" stringByAppendingFormat:@"%@_TXTVIEW_%@",self.ax_prefix,tag];
        }
        if (!self.accessibilityLabel)
        {
            NSString *tag = [self ax_accessibilityIdentifierTag];
            self.accessibilityLabel =
            [@"" stringByAppendingFormat:@"%@_TXTVIEW_%@",self.ax_prefix,tag];
        }
    }
}

@end

//
// Created by Konrad Szczesniak on 21/07/15.
//

#import "UIView+BGImageSnapshot.h"

@implementation UIView (BGImageSnapshot)

- (UIImage *)imageContainingAllSubviews
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
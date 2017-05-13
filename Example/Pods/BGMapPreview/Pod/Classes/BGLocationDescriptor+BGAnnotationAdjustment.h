//
// Created by Bartlomiej Guminiak on 31/08/15.
//

#import <Foundation/Foundation.h>
#import "BGLocationDescriptor.h"

@interface BGLocationDescriptor (BGAnnotationAdjustment)

- (CGFloat)horizontalAdjustmentWithWidth:(CGFloat)width anchor:(BGPinHorizontalAnchor)anchor;
- (CGFloat)verticalAdjustmentWithHeight:(CGFloat)height anchor:(BGPinVerticalAnchor)anchor;

- (CGPoint)offsetForDescriptors:(NSArray *)descriptors;
- (CGPoint)offsetForDescriptor:(BGLocationDescriptor *)descriptor;

@end
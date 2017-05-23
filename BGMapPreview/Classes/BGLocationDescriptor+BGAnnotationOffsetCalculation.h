//
// Created by Bartlomiej Guminiak on 31/08/15.
//

#import <Foundation/Foundation.h>
#import <BGMapPreview/BGLocationDescriptor.h>

@interface BGLocationDescriptor (BGAnnotationOffsetCalculation)

+ (CGFloat)horizontalAdjustmentWithWidth:(CGFloat)width anchor:(BGPinHorizontalAnchor)anchor;
+ (CGFloat)verticalAdjustmentWithHeight:(CGFloat)height anchor:(BGPinVerticalAnchor)anchor;

+ (CGPoint)mapViewOffsetForDescriptors:(NSArray *)descriptors;

@end
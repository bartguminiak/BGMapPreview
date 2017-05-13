//
// Created by Bartlomiej Guminiak on 31/08/15.
//

#import "BGLocationDescriptor+BGAnnotationAdjustment.h"

@implementation BGLocationDescriptor (BGAnnotationAdjustment)

- (CGFloat)horizontalAdjustmentWithWidth:(CGFloat)width anchor:(BGPinHorizontalAnchor)anchor
{
    switch (anchor) {
        case BGPinHorizontalAnchorLeft:
            return 0;
        case BGPinHorizontalAnchorCenter:
            return -(width / 2);
        case BGPinHorizontalAnchorRight:
            return -width;
    }

    return 0;
}

- (CGFloat)verticalAdjustmentWithHeight:(CGFloat)height anchor:(BGPinVerticalAnchor)anchor
{
    switch (anchor) {
        case BGPinVerticalAnchorTop:
            return 0;
        case BGPinVerticalAnchorCenter:
            return -(height / 2);
        case BGPinVerticalAnchorBottom:
            return -height;
    }

    return 0;
}

- (CGPoint)offsetForDescriptors:(NSArray *)descriptors
{
    __block CGFloat x = 0;
    __block CGFloat y = 0;

    [descriptors enumerateObjectsUsingBlock:^(BGLocationDescriptor *descriptor, NSUInteger idx, BOOL *stop) {
        CGPoint descriptorOffset = [self offsetForDescriptor:descriptor];
        if (descriptorOffset.y < y) y = descriptorOffset.y;
        if (descriptorOffset.x < x) x = descriptorOffset.x;

    }];
    return CGPointMake(x, y);
}

- (CGPoint)offsetForDescriptor:(BGLocationDescriptor *)descriptor
{
    CGPoint offsetPoint = CGPointZero;

    CGFloat height = CGRectGetHeight(descriptor.annotationView.frame);
    CGFloat width = CGRectGetWidth(descriptor.annotationView.frame);

    switch (descriptor.verticalAnchor) {
        case BGPinVerticalAnchorTop:
            offsetPoint.y = 0;
            break;
        case BGPinVerticalAnchorCenter:
            offsetPoint.y = -(height / 2);
            break;
        case BGPinVerticalAnchorBottom:
            offsetPoint.y = -height;
        default:
            break;
    }

    switch (descriptor.horizontalAnchor) {
        case BGPinHorizontalAnchorLeft:
            offsetPoint.x = 0;
            break;
        case BGPinHorizontalAnchorCenter:
            offsetPoint.y = -(width / 2);
            break;
        case BGPinHorizontalAnchorRight:
            offsetPoint.y = -width;
            break;
        default:
            break;
    }

    return offsetPoint;
}

@end
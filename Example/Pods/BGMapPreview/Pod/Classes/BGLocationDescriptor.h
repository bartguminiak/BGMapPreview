//
// Created by Konrad Szczesniak on 21/07/15.
//

#import <Foundation/Foundation.h>

@class CLLocation;

typedef NS_ENUM(NSUInteger, BGPinVerticalAnchor) {
    BGPinVerticalAnchorTop,
    BGPinVerticalAnchorCenter,
    BGPinVerticalAnchorBottom
};

typedef NS_ENUM(NSUInteger, BGPinHorizontalAnchor) {
    BGPinHorizontalAnchorLeft,
    BGPinHorizontalAnchorCenter,
    BGPinHorizontalAnchorRight
};

@interface BGLocationDescriptor : NSObject

@property (nonatomic, strong) UIView *annotationView;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic) BGPinHorizontalAnchor horizontalAnchor;
@property (nonatomic) BGPinVerticalAnchor verticalAnchor;

- (NSString *)cacheKey;

@end
//
// Created by Konrad Szczesniak on 21/07/15.
//

#import <MapKit/MapKit.h>
#import "BGLocationDescriptor.h"

@implementation BGLocationDescriptor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _horizontalAnchor = BGPinHorizontalAnchorCenter;
        _verticalAnchor = BGPinVerticalAnchorBottom;
    }

    return self;
}

- (NSString *)cacheKey
{
    return [NSString stringWithFormat:@"%f%f",
            self.location.coordinate.latitude,
            self.location.coordinate.longitude];
}

@end
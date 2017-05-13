//
//  Created by Konrad Szczesniak on 23/07/15.
//

#import <MapKit/MapKit.h>
#import "BGMapPreviewCache+DescriptorCache.h"
#import "BGLocationDescriptor.h"

@implementation BGMapPreviewCache (DescriptorCache)

- (void)cacheImage:(UIImage *)image forDescriptors:(NSArray *)descriptors
{
    [self setObject:image forKey:[self cacheKeyForDescriptors:descriptors]];
}

- (UIImage *)cachedImageForDescriptors:(NSArray *)descriptors
{
    return [self objectForKey:[self cacheKeyForDescriptors:descriptors]];
}

- (NSString *)cacheKeyForDescriptors:(NSArray *)descriptors
{
    NSMutableString *string = [NSMutableString new];
    [descriptors enumerateObjectsUsingBlock:^(BGLocationDescriptor *descriptor, __unused NSUInteger idx, __unused BOOL *stop) {
        [string appendString:[descriptor cacheKey]];
    }];
    return [string copy];
}

@end

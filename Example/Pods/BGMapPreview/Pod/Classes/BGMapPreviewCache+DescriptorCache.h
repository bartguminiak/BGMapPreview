//
//  Created by Konrad Szczesniak on 23/07/15.
//

#import "BGMapPreview/BGMapPreviewCache.h"

@interface BGMapPreviewCache (DescriptorCache)

- (void)cacheImage:(UIImage *)image forDescriptors:(NSArray *)descriptors;
- (UIImage *)cachedImageForDescriptors:(NSArray *)descriptors;

@end

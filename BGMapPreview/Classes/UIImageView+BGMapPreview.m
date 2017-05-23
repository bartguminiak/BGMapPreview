//
// Created by Bartlomiej Guminiak on 03/07/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import "UIImageView+BGMapPreview.h"
#import "UIImageView+BGOperationStorage.h"
#import "BGPreviewOperation.h"
#import "BGMapPreviewCache.h"
#import "BGMapPreviewCache+DescriptorCache.h"

@implementation UIImageView (BGMapPreview)

- (void)setPreviewWithLocationDescriptor:(BGLocationDescriptor *)descriptor
{
    [self setPreviewWithLocationDescriptors:@[descriptor]];
}

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors
{
    [self setPreviewWithLocationDescriptors:descriptors placeholder:nil imageSize:self.frame.size];
}

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors placeholder:(UIImage *)placeholder
{
    [self setPreviewWithLocationDescriptors:descriptors placeholder:placeholder imageSize:self.frame.size];
}

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors placeholder:(UIImage *)placeholder imageSize:(CGSize)imageSize
{
    if (CGSizeEqualToSize(imageSize, CGSizeZero)) {
        [NSException raise:@"BGMapPreview_ImageSizeIsZero" format:@"BGMapPreview - imageSize cannot be .zero!\nIf you use autolayout, specify the size using proper methods.\nFor ObjC: - (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors placeholder:(UIImage *)placeholder imageSize:(CGSize)imageSize\nFor Swift: func setPreviewWithLocationDescriptors(_ descriptors: [Any]!, placeholder: UIImage!, imageSize: CGSize)"];
    }
    
    [self.previewOperation cancel];

    UIImage *cachedImage = [[BGMapPreviewCache sharedInstance] cachedImageForDescriptors:descriptors];
    if (cachedImage) {
        self.image = cachedImage;
        return;
    } else if (placeholder) {
        self.image = placeholder;
    }

    self.previewOperation = [BGPreviewOperation operationWithDescriptors:descriptors
                                                                  imageSize:imageSize];
    __weak typeof (self) weakSelf = self;
    self.previewOperation.completionImage = ^(UIImage *finalImage) {
        [[BGMapPreviewCache sharedInstance] cacheImage:finalImage forDescriptors:descriptors];
        weakSelf.image = finalImage;
    };

    [self.previewOperation start];
}

@end

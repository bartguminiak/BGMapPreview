//
// Created by Bartlomiej Guminiak on 03/07/15.
// Copyright (c) 2015 DocPlanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGLocationDescriptor.h"

@class BGLocationDescriptor;

@interface UIImageView (BGMapPreview)

- (void)setPreviewWithLocationDescriptor:(BGLocationDescriptor *)descriptor;

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors;

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors
                              placeholder:(UIImage *)placeholder;

- (void)setPreviewWithLocationDescriptors:(NSArray *)descriptors
                              placeholder:(UIImage *)placeholder
                                imageSize:(CGSize)imageSize;

@end
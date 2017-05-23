//
// Created by Bartlomiej Guminiak on 28/08/15.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class BGMapPreviewCache;

typedef void(^completionImage)(UIImage *finalImage);

@interface BGPreviewOperation : NSOperation

+ (instancetype)operationWithDescriptors:(NSArray *)descriptors imageSize:(CGSize)imageSize;

@property (nonatomic, copy) completionImage completionImage;

@end
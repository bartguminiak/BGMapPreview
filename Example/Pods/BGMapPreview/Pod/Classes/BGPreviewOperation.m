//
// Created by Bartlomiej Guminiak on 28/08/15.
//

#import "BGPreviewOperation.h"
#import "BGLocationDescriptor.h"
#import "UIView+BGImageSnapshot.h"
#import "MKMapView+BGImageSnapshot.h"
#import "MKMapView+BGCreation.h"
#import "BGLocationDescriptor+BGAnnotationOffsetCalculation.h"

@interface BGPreviewOperation ()

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic) CGSize imageSize;
@property (nonatomic, strong) NSArray *descriptors;

@property (assign) BOOL shouldTerminate;

@end

@implementation BGPreviewOperation

+ (instancetype)operationWithDescriptors:(NSArray *)descriptors imageSize:(CGSize)imageSize
{
    BGPreviewOperation *operation = [self new];
    operation.descriptors = descriptors;
    operation.imageSize = imageSize;
    return operation;
}

- (void)main
{
    @autoreleasepool {

        self.mapView = [MKMapView mapWithDescriptors:self.descriptors size:self.imageSize];

        if (self.shouldTerminate) {
            return;
        }
        [self.mapView snapshotDataWithCompletion:^(UIImage *previewImage, NSError *error) {

            if (self.shouldTerminate) {
                return;
            }
            __block UIImageView *workingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.imageSize.width, self.imageSize.height)];
            workingImageView.image = previewImage;

            [self.descriptors enumerateObjectsUsingBlock:^(BGLocationDescriptor *descriptor, NSUInteger idx, __unused BOOL *stop) {
                id<MKAnnotation> annotation = self.mapView.annotations[idx];
                CGPoint point = [self.mapView convertCoordinate:annotation.coordinate toPointToView:self.mapView];
                CGRect frame = descriptor.annotationView.frame;
                frame.origin.x = point.x + [BGLocationDescriptor horizontalAdjustmentWithWidth:frame.size.width
                                                                        anchor:descriptor.horizontalAnchor];
                frame.origin.y = point.y + [BGLocationDescriptor verticalAdjustmentWithHeight:frame.size.height
                                                                       anchor:descriptor.verticalAnchor];
                descriptor.annotationView.frame = frame;
                [workingImageView addSubview:descriptor.annotationView];
            }];

            UIImage *finalImage = [workingImageView imageContainingAllSubviews];

            if (self.completionImage) {
                self.completionImage(finalImage);
            }
        }];
    }
}

- (void)cancel
{
    [super cancel];

    self.shouldTerminate = YES;
}

@end
//
// Created by Konrad Szczesniak on 21/07/15.
//

#import <MapKit/MapKit.h>

@interface MKMapView (BGImageSnapshot)

- (void)snapshotDataWithCompletion:(void (^)(UIImage *previewImage, NSError *error))completion;
- (void)zoomOnAnnotationsConsideringOffsetPoint:(CGPoint)offsetPoint;

@end
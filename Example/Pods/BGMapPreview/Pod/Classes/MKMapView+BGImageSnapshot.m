//
// Created by Konrad Szczesniak on 21/07/15.
//

#import "MKMapView+BGImageSnapshot.h"

@implementation MKMapView (BGImageSnapshot)

- (void)snapshotDataWithCompletion:(void (^)(UIImage *previewImage, NSError *error))completion
{
    MKMapSnapshotOptions *options = [MKMapSnapshotOptions new];
    options.region = self.region;
    options.size = self.frame.size;

    MKMapSnapshotter *snapshotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        if (error) {
            if (completion) {
                completion(nil, error);
            }
            return;
        }

        UIImage *previewImage = snapshot.image;
        if (completion && previewImage) {
            completion(previewImage, nil);
        }
    }];
}

- (void)zoomOnAnnotationsConsideringOffsetPoint:(CGPoint)offsetPoint
{
    double minLat = 90.0f, maxLat = -90.0f;
    double minLon = 180.0f, maxLon = -180.0f;
    double zoomFactor = 1.5f;

    for (id<MKAnnotation> annotation in self.annotations) {
        if ( annotation.coordinate.latitude  < minLat ) minLat = annotation.coordinate.latitude;
        if ( annotation.coordinate.latitude  > maxLat ) maxLat = annotation.coordinate.latitude;
        if ( annotation.coordinate.longitude < minLon ) minLon = annotation.coordinate.longitude;
        if ( annotation.coordinate.longitude > maxLon ) maxLon = annotation.coordinate.longitude;
    }

    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((minLat+maxLat)/2.0, (minLon+maxLon)/2.0);
    MKCoordinateSpan span;
    if (self.annotations.count <= 1) {
        span =  MKCoordinateSpanMake((maxLat-minLat) * zoomFactor + .01f, (maxLon-minLon) * zoomFactor + .01f);
    } else {
        span = MKCoordinateSpanMake((maxLat-minLat) * zoomFactor, (maxLon-minLon) * zoomFactor);
    }
    MKCoordinateRegion region = MKCoordinateRegionMake (center, span);

    [self setRegion:region];

    CGPoint point = CGPointMake(self.center.x + offsetPoint.x, self.center.y + offsetPoint.y);
    CLLocationCoordinate2D newCenterCoordinate = [self convertPoint:point toCoordinateFromView:self];

    [self setCenterCoordinate:newCenterCoordinate];
}

@end
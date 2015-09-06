//
// Created by Bartlomiej Guminiak on 31/08/15.
//

#import "MKMapView+BGCreation.h"
#import "BGLocationDescriptor.h"
#import "MKMapView+BGImageSnapshot.h"
#import "BGLocationDescriptor+BGAnnotationOffsetCalculation.h"

@implementation MKMapView (BGCreation)

+ (MKMapView *)mapWithDescriptors:(NSArray *)locations size:(CGSize)size
{
    CGRect mapFrame = CGRectMake(0, 0, size.width, size.height);
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:mapFrame];

    __block NSMutableArray *annotations = [NSMutableArray new];
    [locations enumerateObjectsUsingBlock:^(BGLocationDescriptor *descriptor, __unused NSUInteger idx, __unused BOOL *stop) {
        MKPointAnnotation *pointAnnotation = [MKPointAnnotation new];
        pointAnnotation.coordinate = descriptor.location.coordinate;
        [annotations addObject:pointAnnotation];
    }];

    [mapView addAnnotations:annotations.copy];
    [mapView zoomOnAnnotationsConsideringOffsetPoint:[BGLocationDescriptor mapViewOffsetForDescriptors:locations]];

    return mapView;
}

@end
//
// Created by Bartlomiej Guminiak on 31/08/15.
//

#import <MapKit/MapKit.h>

@interface MKMapView (BGCreation)

+ (MKMapView *)mapWithDescriptors:(NSArray *)locations size:(CGSize)size;

@end
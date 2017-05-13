#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BGLocationDescriptor+BGAnnotationAdjustment.h"
#import "BGLocationDescriptor+BGAnnotationOffset.h"
#import "BGLocationDescriptor+BGAnnotationOffsetCalculation.h"
#import "BGLocationDescriptor.h"
#import "BGMapPreviewCache+DescriptorCache.h"
#import "BGMapPreviewCache.h"
#import "BGPreviewOperation.h"
#import "MKMapView+BGCreation.h"
#import "MKMapView+BGImageSnapshot.h"
#import "UIImageView+BGMapPreview.h"
#import "UIImageView+BGOperationStorage.h"
#import "UIView+BGImageSnapshot.h"

FOUNDATION_EXPORT double BGMapPreviewVersionNumber;
FOUNDATION_EXPORT const unsigned char BGMapPreviewVersionString[];


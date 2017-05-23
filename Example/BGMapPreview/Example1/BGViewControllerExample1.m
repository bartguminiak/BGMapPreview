//
//  BGViewControllerExample1.m
//  BGMapPreview
//
//  Created by Bartlomiej Guminiak on 07/07/2015.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "BGViewControllerExample1.h"
#import <CoreLocation/CLLocation.h>
#import "BGMapPreview/UIImageView+BGMapPreview.h"

@interface BGViewControllerExample1 ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView1;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;
@property (nonatomic, weak) IBOutlet UIImageView *imageView3;

@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) NSArray *pinAssets;

@end

@implementation BGViewControllerExample1

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupFirstImageView];
    [self setupSecondImageView];
    [self setupThirdImageView];
}

#pragma mark - First Image View

- (void)setupFirstImageView
{
    BGLocationDescriptor *locationDescriptor = [BGLocationDescriptor new];
    locationDescriptor.location = [[CLLocation alloc] initWithLatitude:51.5057879f longitude:-0.0887631f];

    UIImageView *annotationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.f, 32.f)];
    annotationView.image = [UIImage imageNamed:@"pin"];
    locationDescriptor.annotationView = annotationView;

    [self.imageView1 setPreviewWithLocationDescriptors:@[locationDescriptor]
                                           placeholder:nil
                                             imageSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 150.f)];
}

#pragma mark - Second Image View

- (void)setupSecondImageView
{
    [self.imageView2 setPreviewWithLocationDescriptors:self.testLocationDescriptorsForSecondImage];
}

- (NSArray *)testLocationDescriptorsForSecondImage
{
    NSMutableArray *mutableLocationDescriptors = [NSMutableArray new];
    __block BGLocationDescriptor *locationDescriptor;
    [self.locations enumerateObjectsUsingBlock:^(CLLocation *location, NSUInteger idx, __unused BOOL *stop) {
        locationDescriptor = [BGLocationDescriptor new];
        locationDescriptor.location = location;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.f, 32.f)];
        imageView.image = [UIImage imageNamed:self.pinAssets[idx]];
        locationDescriptor.annotationView = imageView;
        locationDescriptor.horizontalAnchor = BGPinHorizontalAnchorCenter;
        locationDescriptor.verticalAnchor = BGPinVerticalAnchorBottom;

        [mutableLocationDescriptors addObject:locationDescriptor];
    }];
    return mutableLocationDescriptors.copy;
}

- (NSArray *)pinAssets
{
    if (!_pinAssets) {
        _pinAssets = @[
                @"wifi",
                @"petrol-station",
                @"star"
        ];
    }
    return _pinAssets;
}

#pragma mark - Third Image View With Placeholder

- (void)setupThirdImageView
{
    // First circle (34)
    BGLocationDescriptor *locationDescriptor1 = [BGLocationDescriptor new];
    locationDescriptor1.location = self.locations[0];

    UIView *annotationView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36.f, 36.f)];
    annotationView1.backgroundColor = [UIColor redColor];
    annotationView1.layer.cornerRadius = 18.f;

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 36.f, 36.f)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor whiteColor];
    label1.text = @"34";
    label1.font = [UIFont systemFontOfSize:14.f];
    label1.textAlignment = NSTextAlignmentCenter;

    [annotationView1 addSubview:label1];

    locationDescriptor1.annotationView = annotationView1;

    locationDescriptor1.horizontalAnchor = BGPinHorizontalAnchorCenter;
    locationDescriptor1.verticalAnchor = BGPinVerticalAnchorBottom;

    // Second circle (17)
    BGLocationDescriptor *locationDescriptor2 = [BGLocationDescriptor new];
    locationDescriptor2.location = self.locations[1];

    UIView *annotationView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20.f, 20.f)];
    annotationView2.backgroundColor = [UIColor redColor];
    annotationView2.layer.cornerRadius = 10.f;

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20.f, 20.f)];
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.text = @"17";
    label2.font = [UIFont systemFontOfSize:10.f];
    label2.textAlignment = NSTextAlignmentCenter;

    [annotationView2 addSubview:label2];

    locationDescriptor2.annotationView = annotationView2;

    locationDescriptor2.horizontalAnchor = BGPinHorizontalAnchorCenter;
    locationDescriptor2.verticalAnchor = BGPinVerticalAnchorBottom;

    // Third circle (23)
    BGLocationDescriptor *locationDescriptor3 = [BGLocationDescriptor new];
    locationDescriptor3.location = self.locations[2];

    UIView *annotationView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 28.f, 28.f)];
    annotationView3.backgroundColor = [UIColor redColor];
    annotationView3.layer.cornerRadius = 14.f;

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 28.f, 28.f)];
    label3.backgroundColor = [UIColor clearColor];
    label3.textColor = [UIColor whiteColor];
    label3.text = @"23";
    label3.font = [UIFont systemFontOfSize:12.f];
    label3.textAlignment = NSTextAlignmentCenter;

    [annotationView3 addSubview:label3];

    locationDescriptor3.annotationView = annotationView3;

    locationDescriptor3.horizontalAnchor = BGPinHorizontalAnchorCenter;
    locationDescriptor3.verticalAnchor = BGPinVerticalAnchorBottom;

    [self.imageView3 setPreviewWithLocationDescriptors:@[locationDescriptor1, locationDescriptor2, locationDescriptor3]
                                           placeholder:[UIImage imageNamed:@"map_placeholder"]];
}

#pragma mark - Common

- (NSArray *)locations
{
    if (!_locations) {
        _locations = @[
                [[CLLocation alloc] initWithLatitude:52.233582f longitude:20.996606f],
                [[CLLocation alloc] initWithLatitude:52.231582f longitude:20.991606f],
                [[CLLocation alloc] initWithLatitude:52.235582f longitude:20.991606f]
        ];
    }
    return _locations;
}

@end

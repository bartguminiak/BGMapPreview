//
// Created by Bartlomiej Guminiak on 07/07/15.
// Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "BGViewControllerExample2.h"
#import <CoreLocation/CLLocation.h>
#import <BGMapPreview/UIImageView+BGMapPreview.h>
#import "BGMapPreviewCellTableViewCell.h"

@interface BGViewControllerExample2() <UITableViewDataSource>

@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) NSMutableSet *annotations;

@property (nonatomic, strong) NSArray *descriptors;

@end

@implementation BGViewControllerExample2

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50.f, 0);
}

#pragma mark - UITableViewDataSource

static NSString *const cellId = @"mapPreviewCellId";

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BGMapPreviewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    [cell.mapPreviewImageView setPreviewWithLocationDescriptors:self.descriptors[(NSUInteger)indexPath.row]
                                                    placeholder:[UIImage imageNamed:@"map_placeholder"]
                                                      imageSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width , 119.f)];

    return cell;
}

- (NSArray *)descriptors
{
    if (!_descriptors) {
        NSMutableArray *mutableDescriptors = [NSMutableArray new];
        __block BGLocationDescriptor *descriptor;
        [self.locations enumerateObjectsUsingBlock:^(NSArray *locations, __unused NSUInteger idx1, __unused BOOL *stop1) {

            __block NSMutableArray *singleCellDescriptors = [NSMutableArray new];
            [locations enumerateObjectsUsingBlock:^(CLLocation *location, __unused NSUInteger idx2, __unused  BOOL *stop2) {
                descriptor = [BGLocationDescriptor new];
                descriptor.location = location;
                descriptor.annotationView = self.anyAnnotation;

                [singleCellDescriptors addObject:descriptor];
            }];
            [mutableDescriptors addObject:singleCellDescriptors.copy];
        }];
        _descriptors = mutableDescriptors.copy;
    }
    return _descriptors;
}

- (NSArray *)locations
{
    if (!_locations) {
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:52.1173916f longitude:21.1517556f];
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:52.1273916f longitude:21.2117556f];
        CLLocation *location3 = [[CLLocation alloc] initWithLatitude:52.1073916f longitude:21.3417556f];
        CLLocation *location4 = [[CLLocation alloc] initWithLatitude:52.1373916f longitude:21.1217556f];
        CLLocation *location5 = [[CLLocation alloc] initWithLatitude:52.0973916f longitude:21.2917556f];
        CLLocation *location6 = [[CLLocation alloc] initWithLatitude:52.1473916f longitude:21.317556f];
        CLLocation *location7 = [[CLLocation alloc] initWithLatitude:52.0873916f longitude:21.1717556f];
        CLLocation *location8 = [[CLLocation alloc] initWithLatitude:52.1573916f longitude:21.2417556f];
        CLLocation *location9 = [[CLLocation alloc] initWithLatitude:52.0773916f longitude:21.3917556f];

        _locations = @[
                @[location1],
                @[location1, location2],
                @[location1, location2, location3],
                @[location1, location2, location3, location4],
                @[location1, location2, location3, location5, location6],
                @[location1, location2, location3, location5, location6, location7],
                @[location1, location2, location3, location5, location6, location7, location8],
                @[location1, location2, location3, location5, location6, location7, location8, location9],
                @[location9],
                @[location9, location8],
                @[location9, location8, location7],
                @[location9, location8, location7, location6],
                @[location9, location8, location7, location6, location5],
                @[location9, location8, location7, location6, location5, location4],
                @[location9, location8, location7, location6, location5, location4, location3],
                @[location9, location8, location7, location6, location5, location4, location3, location2],
                @[location9, location8, location7, location6, location5, location4, location3, location2, location1],
        ];
    }
    return _locations;
}

- (UIImageView *)anyAnnotation
{
    UIImageView *annotation = self.annotations.anyObject;
    [self.annotations removeObject:annotation];

    return annotation;
}

- (NSMutableSet *)annotations
{
    if (!_annotations || _annotations.count == 0) {
        _annotations = [NSMutableSet new];
        __block UIImageView *annotation;
        [@[
                @"pin_green",
                @"pin_red",
                @"pin_blue",
                @"pin_yellow",
                @"pin_pink"] enumerateObjectsUsingBlock:^(NSString *pinName, __unused NSUInteger idx, __unused BOOL *stop) {

            annotation = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.f, 32.f)];
            annotation.image = [UIImage imageNamed:pinName];
            [_annotations addObject:annotation];
        }];
    }
    return _annotations;
}

@end
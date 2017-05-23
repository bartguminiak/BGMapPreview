//
// Created by Konrad Szczesniak on 21/07/15.
//

#import "BGMapPreviewCache.h"

@implementation BGMapPreviewCache

+ (BGMapPreviewCache *)sharedInstance
{
    static BGMapPreviewCache *mapPreviewImageCache = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        mapPreviewImageCache = [BGMapPreviewCache new];

        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification
                                                          object:nil
                                                           queue:[NSOperationQueue mainQueue]
                                                      usingBlock:^(NSNotification * __unused notification) {
                                                          [mapPreviewImageCache removeAllObjects];
                                                      }];
    });
    return mapPreviewImageCache;
}

@end
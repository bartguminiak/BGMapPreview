//
// Created by Bartlomiej Guminiak on 01/09/15.
//

#import <Foundation/Foundation.h>

@class BGPreviewOperation;

@interface UIImageView (BGOperationStorage)

@property (nonatomic, strong) BGPreviewOperation *previewOperation;

@end
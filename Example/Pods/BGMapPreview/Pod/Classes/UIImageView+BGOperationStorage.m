//
// Created by Bartlomiej Guminiak on 01/09/15.
//

#import <objc/runtime.h>
#import "UIImageView+BGOperationStorage.h"
#import "BGPreviewOperation.h"


@implementation UIImageView (BGOperationStorage)

static char kAssociatedOperatingKey;

- (BGPreviewOperation *)previewOperation
{
    return objc_getAssociatedObject(self, &kAssociatedOperatingKey);
}

- (void)setPreviewOperation:(BGPreviewOperation *)previewOperation
{
    objc_setAssociatedObject(self, &kAssociatedOperatingKey, previewOperation, OBJC_ASSOCIATION_RETAIN);
}

@end
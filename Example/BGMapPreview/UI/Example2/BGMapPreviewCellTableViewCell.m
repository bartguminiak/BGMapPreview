//
//  BGMapPreviewCellTableViewCell.m
//  BGMapPreview
//
//  Created by Bartlomiej Guminiak on 07/07/15.
//  Copyright (c) 2015 Bartlomiej Guminiak. All rights reserved.
//

#import "BGMapPreviewCellTableViewCell.h"

@implementation BGMapPreviewCellTableViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.mapPreviewImageView.image = nil;
}

@end

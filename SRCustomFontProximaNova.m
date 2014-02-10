//
//  SRCustomFontProximaNova.m
//  SiteReader
//
//  Created by Collin Hartigan on 2/9/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "SRCustomFontProximaNova.h"

@implementation SRCustomFontProximaNova

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib]; self.font = [UIFont fontWithName:@"ProximaNova-Regular" size:self.font.pointSize];
    
}
@end

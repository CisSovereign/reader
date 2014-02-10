//
//  BlogPost.m
//  SiteReader
//
//  Created by Collin Hartigan on 2/9/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self){
        self.title = title;
    }
    
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}


@end

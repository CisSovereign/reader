//
//  BlogPost.h
//  SiteReader
//
//  Created by Collin Hartigan on 2/9/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
  


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;

//Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *) title;

@end
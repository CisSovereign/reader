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
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url; 

//Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *) title;

-(NSString *) formattedDate;

@end

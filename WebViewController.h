//
//  WebViewController.h
//  SiteReader
//
//  Created by Collin Hartigan on 2/13/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

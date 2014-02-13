//
//  SRTableViewController.m
//  SiteReader
//
//  Created by Collin Hartigan on 2/8/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "SRTableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"


@interface SRTableViewController () {
    UIRefreshControl *refreshControl;
}

@end

@implementation SRTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *blogURL = [NSURL URLWithString:@"https://news.layervault.com/stories?format=json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;

    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error: &error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"stories"];
    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey: @"submitter_display_name"];
        blogPost.date = [bpDictionary objectForKey: @"created_at"];
        blogPost.url = [NSURL URLWithString: [bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:refreshControl];
    
}

- (void)refreshTableView
{
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.blogPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = blogPost.title;
    cell.textLabel.font = [UIFont fontWithName:@"ProximaNova-Regular" size:14];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | %@", blogPost.author, [blogPost formattedDate]];
    cell.detailTextLabel.font = [UIFont fontWithName:@"ProximaNova-Light" size:10];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare for segue %@", segue.identifier);
    
    if ( [segue.identifier isEqualToString:@"showBlogPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        [segue.destinationViewController setBlogPostURL:blogPost.url];
        
    }
}



@end

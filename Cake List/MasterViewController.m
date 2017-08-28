//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "CakeCell.h"
#import "CakeModel.h"
#import "CakeListInteractor.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSArray<CakeModel*> *cakeObjects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cakeObjects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"CakeCell"];
    
    CakeModel *cake = self.cakeObjects[indexPath.row];
    
    cell.titleLabel.text = cake.titleText;
    cell.descriptionLabel.text = cake.descriptionText;
 
    NSURL *aURL = [NSURL URLWithString:cake.imagePath];
    [[[NSURLSession sharedSession] dataTaskWithURL:aURL
                                 completionHandler:^(NSData * _Nullable data,
                                                     NSURLResponse * _Nullable response,
                                                     NSError * _Nullable error) {
        if (!error && data != nil) {
            UIImage *image = [UIImage imageWithData:data];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [cell.cakeImageView setImage:image];
            }];
        }
    }] resume];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Data Loading

- (void)getData {
    NSURL *url = [NSURL URLWithString:@"https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json"];
    
    [CakeListInteractor fetchCakeListFromURL:url
                          withSuccessHandler:^(NSArray<CakeModel *> *cakes) {
                              self.cakeObjects = cakes;
                              [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                  [self.tableView reloadData];
                              }];
                          }
                                errorHandler:nil];
}

@end

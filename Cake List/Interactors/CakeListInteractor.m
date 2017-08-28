//
//  CakeListInteractor.m
//  Cake List
//
//  Created by Andrew Boyd on 28/08/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "CakeListInteractor.h"
#import "CakeModel.h"

@implementation CakeListInteractor

+ (void)fetchCakeListFromURL:(NSURL *)url
          withSuccessHandler:(CakeListSuccessBlock)successBlock
                errorHandler:(CakeListErrorBlock)errorBlock {
    [[[NSURLSession sharedSession] dataTaskWithURL:url
                                 completionHandler:^(NSData * _Nullable data,
                                                     NSURLResponse * _Nullable response,
                                                     NSError * _Nullable error) {
                                     if (!error && data != nil) {
                                         NSError *jsonError;
                                         NSArray *responseArray = [NSJSONSerialization
                                                                   JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                   error:&jsonError];
                                         if (!jsonError && responseArray != nil) {
                                             
                                             NSMutableArray *cakes = [NSMutableArray new];
                                             for (NSDictionary *jsonDict in responseArray) {
                                                 CakeModel *newCake = [[CakeModel alloc] initWithJSON:jsonDict];
                                                 if (newCake != nil) {
                                                     [cakes addObject:newCake];
                                                 }
                                             }
                                             
                                             if (successBlock != nil) {
                                                 successBlock(cakes);
                                             }
                                         }
                                     } else {
                                         if (errorBlock != nil) {
                                             errorBlock(error);
                                         }
                                     }
                                 }] resume];
}

@end

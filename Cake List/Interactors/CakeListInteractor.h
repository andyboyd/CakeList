//
//  CakeListInteractor.h
//  Cake List
//
//  Created by Andrew Boyd on 28/08/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CakeModel;

typedef void (^CakeListSuccessBlock)(NSArray<CakeModel *> *cakes);
typedef void (^CakeListErrorBlock)(NSError *error);

@interface CakeListInteractor : NSObject

/**
 * Calls to a URL and parses the response into an array of CakeModel objects
 * @param url the URL from which to fethc the cake list
 * @param successBlock a block to be called when the network call returns successfully with valid data
 * @param errorBlock a block to be called when the network call fails or returns invalid data
 **/
+ (void)fetchCakeListFromURL:(NSURL*)url
          withSuccessHandler:(CakeListSuccessBlock)successBlock
                errorHandler:(CakeListErrorBlock)errorBlock;

@end

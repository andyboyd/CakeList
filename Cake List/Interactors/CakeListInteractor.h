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

+ (void)fetchCakeListFromURL:(NSURL*)url
          withSuccessHandler:(CakeListSuccessBlock)successBlock
                errorHandler:(CakeListErrorBlock)errorBlock;

@end

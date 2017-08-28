//
//  CakeModel.h
//  Cake List
//
//  Created by Andrew Boyd on 28/08/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CakeModel : NSObject

//These are all nullable because I've seen no guarantee anywhere that the API can't send null for any given field
//Readonly to ensure they can't be accidentally changed by anything but the designated initializer
@property (nonatomic, readonly, strong, nullable) NSString *imagePath;
@property (nonatomic, readonly, strong, nullable) NSString *titleText;
@property (nonatomic, readonly, strong, nullable) NSString *descriptionText;

- (instancetype)initWithJSON:(NSDictionary*)json NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

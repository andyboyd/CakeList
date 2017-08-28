//
//  CakeModel.m
//  Cake List
//
//  Created by Andrew Boyd on 28/08/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "CakeModel.h"

@interface CakeModel()

@property (nonatomic, readwrite, strong, nullable) NSString *imagePath;
@property (nonatomic, readwrite, strong, nullable) NSString *titleText;
@property (nonatomic, readwrite, strong, nullable) NSString *descriptionText;

@end

@implementation CakeModel

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        self.titleText = json[@"title"];
        self.descriptionText = json[@"desc"];
        self.imagePath = json[@"image"];
    }
    
    return self;
}

- (instancetype)init {
    NSAssert(NO, @"this should never be called, use the designated initialiser -initWithJSON: instead");
    
    return [self initWithJSON:@{}];
}

@end

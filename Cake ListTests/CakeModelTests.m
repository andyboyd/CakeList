//
//  CakeModelTests.m
//  Cake ListTests
//
//  Created by Andrew Boyd on 28/08/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CakeModel.h"

@interface CakeModelTests : XCTestCase

@property (strong, nonatomic) NSDictionary *validJSON;

@end

@implementation CakeModelTests

- (void)setUp {
    [super setUp];
    
    self.validJSON = @{@"title" :   @"Test Cake",
                       @"desc"  :   @"This is a cake. It tastes very good, hopefully!",
                       @"image" :   @"http://anyoldurl-itsjustastring"
                       };
}

- (void)test_initWithJSON_validJSON_populatesTitle {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:self.validJSON];
    XCTAssertEqualObjects(cake.titleText, @"Test Cake");
}

- (void)test_initWithJSON_validJSON_populatesDescription {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:self.validJSON];
    XCTAssertEqualObjects(cake.descriptionText, @"This is a cake. It tastes very good, hopefully!");
}

- (void)test_initWithJSON_validJSON_populatesImagePath {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:self.validJSON];
    XCTAssertEqualObjects(cake.imagePath, @"http://anyoldurl-itsjustastring");
}

- (void)test_initWithJSON_missingTitleField_titleIsNil {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertNil(cake.titleText);
}

- (void)test_initWithJSON_missingTitleField_descriptionIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.descriptionText, @"foo");
}

- (void)test_initWithJSON_missingTitleField_imageIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.imagePath, @"bar");
}

- (void)test_initWithJSON_missingDescField_descriptionIsNil {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"title"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertNil(cake.descriptionText);
}

- (void)test_initWithJSON_missingDescField_titleIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"title"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.titleText, @"foo");
}

- (void)test_initWithJSON_missingDescField_imageIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"title"  : @"foo",
                                                        @"image" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.imagePath, @"bar");
}

- (void)test_initWithJSON_missingImageField_imageIsNil {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"title" : @"bar"
                                                        }];
    
    XCTAssertNil(cake.imagePath);
}

- (void)test_initWithJSON_missingImageField_descriptionIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"title" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.descriptionText, @"foo");
}

- (void)test_initWithJSON_missingImageField_titleIsCorrect {
    CakeModel *cake = [[CakeModel alloc] initWithJSON:@{@"desc"  : @"foo",
                                                        @"title" : @"bar"
                                                        }];
    
    XCTAssertEqualObjects(cake.titleText, @"bar");
}

- (void)test_init_shouldAssert
{
    XCTAssertThrows([[CakeModel alloc] init]);
}

@end

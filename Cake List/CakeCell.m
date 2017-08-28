//
//  CakeCell.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "CakeCell.h"

@implementation CakeCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.titleLabel.text = nil;
    self.descriptionLabel.text = nil;
    self.cakeImageView.image = [UIImage imageNamed:@"cake_placeholder"];
}

@end

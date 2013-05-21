//
//  PrettySlide.m
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import "PrettySlide.h"

@implementation PrettySlide


-(id)initWithForegroundView:(UIView *)foregroundView backgroundView:(UIView *)backgroundView{
    self = [super init];
    if (self) {
        _foregroundView=foregroundView;
        _backgroundView=backgroundView;
    }
    return self;

}
@end

//
//  PrettySlide.h
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrettySlide : NSObject

@property (nonatomic,strong) UIView *foregroundView;
@property (nonatomic,strong) UIView *backgroundView;

-(id)initWithForegroundView:(UIView *)foregroundView backgroundView:(UIView *)backgroundView;


@end

//
//  PrettySlide.h
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrettySlide : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *body;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIView *foreground;
@property (nonatomic,strong) UIView *background;

-(id)initWithTitle:(NSString *)title body:(NSString *)body image:(UIImage *)image;
-(id)initWithForeground:(UIView *)foreground background:(UIView *)background;


@end

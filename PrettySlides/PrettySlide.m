//
//  PrettySlide.m
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import "PrettySlide.h"

@implementation PrettySlide

- (id)initWithTitle:(NSString *)title body:(NSString *)body image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _title=title;
        _body=body;
        _image=image;
    }
    return self;
}
-(id)initWithForeground:(UIView *)foreground background:(UIView *)background{
    self = [super init];
    if (self) {
        _foreground=foreground;
        _background=background;
    }
    return self;

}
@end

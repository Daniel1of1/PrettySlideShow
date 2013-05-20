//
//  PrettySlideShowViewController.h
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrettySlideShowViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic ,strong) NSArray *slides;

-(id)initWithSlides:(NSArray *)slides;

@end

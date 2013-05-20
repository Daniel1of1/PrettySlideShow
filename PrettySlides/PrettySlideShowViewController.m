//
//  PrettySlideShowViewController.m
//  PrettySlides
//
//  Created by Daniel Haight on 20/05/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import "PrettySlideShowViewController.h"
#import "PrettySlide.h"
#import <QuartzCore/QuartzCore.h>

@interface PrettySlideShowViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation PrettySlideShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithSlides:(NSArray *)slides{
    
    if (self=[super init]) {
        _slides=slides;
    }
    
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupScrollView];
    [self.view addSubview:_scrollView];

    [self addPrettySlides];
    

	
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = self.view.frame.size.width;
    
    //the index of the image correspondong to the slide we are on
    int index = floorf(scrollView.contentOffset.x/pageWidth);
    
    // we change the alpha of the picture at the index we are currently scrolling through and one before and after (unless at the ends)
    //this ensures we don't have 'ghosts' (tiny alpha views) since the scrollviewdid scroll may not fire at exactly the points that set views apha to 0.
    int first = MAX(index-1, 0);
    int last = MIN(_slides.count-2, index+1);
    
    for (int i=first; i<=last; i++) {
        UIView *bg=((PrettySlide *)[_slides objectAtIndex:i]).backgroundView;
        bg.alpha=1+i-scrollView.contentOffset.x/self.view.bounds.size.width;
    }
}

-(void)setupScrollView{
    _scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width*_slides.count, self.view.bounds.size.height);
    _scrollView.delegate=self;
    _scrollView.showsHorizontalScrollIndicator=FALSE;
    _scrollView.pagingEnabled=TRUE;
    self.view.contentMode=UIViewContentModeCenter;
}


-(void)addPrettySlides{
        
    UIView *previousView=_scrollView;
    
    for (int i=0; i<_slides.count; i++) {
        //stack backgroundviews below eachother
        PrettySlide *slide=((PrettySlide *)[_slides objectAtIndex:i]);
        [self.view insertSubview:slide.backgroundView belowSubview:previousView];
        previousView=slide.backgroundView;
        
        //space foreground views out by size of frame width
        CGAffineTransform t=CGAffineTransformMakeTranslation(self.view.bounds.size.width * i, 0);
        slide.foregroundView.frame=CGRectApplyAffineTransform(slide.foregroundView.frame, t);
        [_scrollView addSubview:slide.foregroundView];        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

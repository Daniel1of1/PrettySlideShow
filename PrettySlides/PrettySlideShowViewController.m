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
@property (nonatomic, strong) NSMutableArray *imageViewStack;


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
        _imageViewStack=[[NSMutableArray alloc] init];
        _slides=slides;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollView];
    
    [self addPrettySlides];
    
    [self.view insertSubview:_scrollView aboveSubview:[_imageViewStack objectAtIndex:0]];

	
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = self.view.frame.size.width;
    
    //the index of the image correspondong to the slide we are on
    int index = floorf(scrollView.contentOffset.x/pageWidth);
    
    // we change the alpha of the picture at the index we are currently scrolling through and one before and after (unless at the ends)
    //this ensures we don't have 'ghosts' (tiny alpha views) since the scrollviewdid scroll may not fire at exactly the points that set views apha to 0.
    int first = MAX(index-1, 0);
    int last = MIN(_imageViewStack.count-2, index+1);
    
    for (int i=first; i<=last; i++) {
        UIImageView *im=[_imageViewStack objectAtIndex:i];
        im.alpha=1+i-scrollView.contentOffset.x/self.view.bounds.size.width;
    }
}

-(void)setupScrollView{
    _scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width*_slides.count, self.view.bounds.size.height);
    _scrollView.delegate=self;
    _scrollView.showsHorizontalScrollIndicator=FALSE;
    _scrollView.pagingEnabled=TRUE;
    _scrollView.autoresizingMask= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.contentMode=UIViewContentModeScaleAspectFill;
}

-(UILabel *)titleLabel{
    CGRect frame=self.view.bounds;
    frame.origin.y=frame.origin.y+frame.size.height-160;
    frame.size.height=30;
    frame.size.width=200;
    frame.origin.x=60;
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    return label;
}

-(UILabel *)bodyLabel{
    CGRect frame;
    frame=self.view.bounds;
    frame.origin.y=frame.origin.y+frame.size.height-120;
    frame.size.height=40;
    frame.size.width=280;
    frame.origin.x=20;
    UILabel *descriptionLabel=[[UILabel alloc] initWithFrame:frame];
    descriptionLabel.backgroundColor=[UIColor clearColor];
    descriptionLabel.layer.cornerRadius=5;
    descriptionLabel.numberOfLines=5;
    descriptionLabel.font=[UIFont systemFontOfSize:16];
    descriptionLabel.textColor=[UIColor whiteColor];
    descriptionLabel.textAlignment=NSTextAlignmentCenter;
    [_scrollView addSubview:descriptionLabel];
    return descriptionLabel;
}

-(void)addPrettySlides{
    
    int i=0;
    
    UIImageView *prevImageView=[[UIImageView alloc] init];
    
    [self.view addSubview:prevImageView];
    
    for (PrettySlide *slide in _slides) {
        
        //add imageViews to view and to _imageViewStack
        UIImageView *slideImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
        slideImageView.image=slide.image;
        [self.view insertSubview:slideImageView belowSubview:prevImageView];
        [_imageViewStack addObject:slideImageView];
        prevImageView=slideImageView;
        
        
        //add title label
        UILabel *label=[self titleLabel];
        CGAffineTransform t=CGAffineTransformMakeTranslation(self.view.bounds.size.width *i, 0);
        label.frame=CGRectApplyAffineTransform(label.frame, t);
        label.text=slide.title;
        
        [_scrollView addSubview:label];
        
        //add bodylabel
        UILabel *bodyLabel=[self bodyLabel];
        bodyLabel.frame=CGRectApplyAffineTransform(bodyLabel.frame, t);
        bodyLabel.text=slide.body;
        [_scrollView addSubview:label];
        
        
        i++;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  RTViewController.m
//  TestAnimation
//
//  Created by Ryan Tempas on 5/21/14.
//  Copyright (c) 2014 Ryan Tempas. All rights reserved.
//

#import "RTViewController.h"

static NSInteger kWalkFrames = 13;
static NSInteger kJogFrames = 11;
static NSInteger kRunFrames = 12;
static NSInteger kCrazyRunFrames = 12;


static const NSString *kRun = @"run";
static const NSString *kWalk = @"walk";
static const NSString *kJog = @"jog";
static const NSString *kCrazyRun = @"crazyRun";



static const CGFloat kImageViewSize = 150;

@interface RTViewController ()

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self actionImageViewForStyle:kWalk frame:CGRectMake(50, kImageViewSize/2, kImageViewSize, kImageViewSize) duration:0.48 frames:kWalkFrames];
    [self actionImageViewForStyle:kJog frame:CGRectMake(50, kImageViewSize, kImageViewSize, kImageViewSize) duration:0.38 frames:kJogFrames];
    [self actionImageViewForStyle:kRun frame:CGRectMake(50, kImageViewSize/2*3, kImageViewSize, kImageViewSize) duration:0.324 frames:kRunFrames];
    [self actionImageViewForStyle:kCrazyRun frame:CGRectMake(50, kImageViewSize * 2, kImageViewSize, kImageViewSize) duration:.279 frames:kCrazyRunFrames];
}

- (void)actionImageViewForStyle:(const NSString *)style frame:(CGRect)frame duration:(double)duration frames:(NSInteger)frames
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    NSMutableArray *images = [NSMutableArray new];
    
    const NSString *runStyle = style;
    
    for (NSInteger i = 1; i <= frames; i++)
    {
        
        NSString *imageName;
        if (i < 10)
        {
            imageName = [NSString stringWithFormat:@"%@0%d.png", runStyle, i];
        }
        else
        {
            imageName = [NSString stringWithFormat:@"%@%d.png", runStyle, i];
        }
        
        [images addObject:[UIImage imageNamed:imageName]];
    }
    
    imageView.animationImages = images;
    imageView.animationDuration = duration;
    imageView.animationRepeatCount = 0;
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:imageView];
    
    [imageView startAnimating];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

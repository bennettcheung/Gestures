//
//  EdgePanViewController.m
//  Gestures
//
//  Created by Bennett on 2018-08-09.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController ()


@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UIView *drawerView;
@property (nonatomic, assign) CGPoint originalCenter;
@property (nonatomic, assign) CGRect originalFrame;
@property (nonatomic, assign) CGRect endFrame;

@end

@implementation EdgePanViewController
static int kFrameMoveConstant= 150;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 400;
    CGFloat height = 400;
    self.originalFrame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 20, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
     self.endFrame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 320, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
    
    self.drawerView = [[UIView alloc] initWithFrame:self.originalFrame];
    self.drawerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.drawerView];
    self.originalCenter = self.drawerView.center;
    
    self.edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
    self.edgeGesture.edges = UIRectEdgeRight;
    [self.drawerView  addGestureRecognizer:self.edgeGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)edgePanGesture:(UIPanGestureRecognizer *)sender
{
    
    
    NSLog(@"edgePanGesture called");
    if (sender.state != UIGestureRecognizerStateEnded)
    {
        CGPoint translationInView = [sender translationInView:self.view];
        CGPoint oldCenter = sender.view.center;

        
        CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
        
        NSLog(@"New center %f %f", newCenter.x, newCenter.y);
        if (newCenter.x > self.originalCenter.x - 150)
            newCenter.x = self.originalCenter.x - 150;
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if ([sender isKindOfClass:[UIScreenEdgePanGestureRecognizer class]])
    {
        if (sender.state == UIGestureRecognizerStateEnded)
        {
            //if the move was not significant enough, move rectangle back
            if (sender.view.center.x > self.originalCenter.x - 60){
                [UIView animateWithDuration:0.5 animations:^{
                    self.drawerView.frame = self.originalFrame;
                }];
            }
            else
            {
                [UIView animateWithDuration:0.5 animations:^{
                 
                    self.drawerView.frame = self.endFrame;
                    [self.drawerView removeGestureRecognizer:self.edgeGesture];
                    [self.drawerView addGestureRecognizer:self.panGesture];
                }];
            }
        }
    }
    
    if ([sender isKindOfClass:[UIPanGestureRecognizer class]])
    {
        CGPoint velocity = [sender velocityInView:self.view];
        if (sender.state == UIGestureRecognizerStateEnded && velocity.x > 0)
        {
////            CGPoint translationInView = [sender translationInView:self.view];
//            CGPoint oldCenter = sender.view.center;
//
//            CGPoint newCenter = CGPointMake(oldCenter.x + velocity.x, oldCenter.y);
//
//            sender.view.center = newCenter;
//            [sender setTranslation:CGPointZero inView:self.view];
            
            [UIView animateWithDuration:0.5 animations:^{
                //   [sender setTranslation:CGPointZero inView:self.view];
                self.drawerView.frame = self.originalFrame;
                // user dragged towards the right
                [self.drawerView removeGestureRecognizer:self.panGesture];
                [self.drawerView addGestureRecognizer:self.edgeGesture];
            }];
            
        }
    }
    
    
}
@end

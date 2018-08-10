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
@property (nonatomic, assign) CGRect originalFrame;
@end

@implementation EdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 400;
    CGFloat height = 400;
    self.originalFrame = CGRectMake(CGRectGetMaxX(self.view.bounds) - 20, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
    
    self.drawerView = [[UIView alloc] initWithFrame:self.originalFrame];
    self.drawerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.drawerView];
    
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
    
    [UIView animateWithDuration:0.5 animations:^{
     //   [sender setTranslation:CGPointZero inView:self.view];
        self.drawerView.frame = CGRectOffset(self.drawerView.frame, -150, 0.0);
        [self.drawerView removeGestureRecognizer:self.edgeGesture];
        [self.drawerView addGestureRecognizer:self.panGesture];
    }];
    
    CGPoint velocity = [sender velocityInView:self.view];
    if (sender.state == UIGestureRecognizerStateEnded && velocity.x > 0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            //   [sender setTranslation:CGPointZero inView:self.view];
            self.drawerView.frame = self.originalFrame;
            // user dragged towards the right
            [self.drawerView removeGestureRecognizer:self.panGesture];
            [self.drawerView addGestureRecognizer:self.edgeGesture];
        }];
        
    }
    
    
}
@end

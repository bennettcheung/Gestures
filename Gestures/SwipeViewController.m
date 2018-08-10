//
//  SwipeViewController.m
//  Gestures
//
//  Created by Bennett on 2018-08-09.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

typedef NS_ENUM(NSInteger, OpenState) {OpenStateLeft, OpenStateNotOpen, OpenStateRight};

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *brownView;
@property (nonatomic, assign) OpenState openstate;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 600;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width /2, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
    
    self.brownView = [[UIView alloc] initWithFrame:frame];
    self.brownView.backgroundColor = [UIColor brownColor];
    self.brownView.clipsToBounds = YES;
    [self.view addSubview:self.brownView];
    
    self.whiteView = [[UIView alloc] initWithFrame:frame];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteView];
    
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGuesture:)];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGuesture:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.whiteView addGestureRecognizer:swipeRightRecognizer];
    [self.whiteView addGestureRecognizer:swipeLeftRecognizer];
    
    self.openstate = OpenStateNotOpen;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moveWhiteViewRIght {
    [UIView animateWithDuration:0.5 animations:^{
        self.whiteView.frame = CGRectOffset(self.whiteView.frame, 200.0, 0.0);
    }];
}

- (void)moveWhiteViewLeft {
    [UIView animateWithDuration:0.5 animations:^{
        self.whiteView.frame = CGRectOffset(self.whiteView.frame, -200.0, 0.0);
    }];
}

-(void)swipeGuesture:(UISwipeGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
        {

            switch(self.openstate){
                case OpenStateNotOpen:
                    {
                        self.openstate = OpenStateLeft;
                        [self moveWhiteViewLeft];
                    }
                    break;
                case OpenStateRight:
                    {
                    self.openstate = OpenStateNotOpen;
                        [self moveWhiteViewLeft];
                    }
                    break;
                default:
                    break;
            }
            
        }
        else if  (sender.direction == UISwipeGestureRecognizerDirectionRight)
        {
            switch (self.openstate) {
                case OpenStateNotOpen:
                    {
                        self.openstate = OpenStateRight;
                        [self moveWhiteViewRIght];
                    }
                    break;
                case OpenStateLeft:
                    {
                    self.openstate = OpenStateNotOpen;
                    [self moveWhiteViewRIght];
                    }
                    break;
                default:
                    break;
            }

        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

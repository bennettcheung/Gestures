//
//  rotationViewController.m
//  Gestures
//
//  Created by Bennett on 2018-08-09.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "rotationViewController.h"

@interface rotationViewController ()

@end

@implementation rotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width /2, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *gesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateSquare:)];
    [view addGestureRecognizer:gesture];
    
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
-(void)rotateSquare:(UIRotationGestureRecognizer *)sender{
    
    CGFloat rotation = sender.rotation;
    sender.view.transform = CGAffineTransformMakeRotation(rotation);
    
}
@end

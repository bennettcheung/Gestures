//
//  TabViewController.m
//  Gestures
//
//  Created by Bennett on 2018-08-09.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "TabViewController.h"

@interface TabViewController ()
@property (nonatomic, strong) UIView *squareView;
@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width /2, CGRectGetMidY (self.view.bounds) - height / 2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    self.squareView = view;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGestureRecognizer];
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
-(void)viewTapped:(UITapGestureRecognizer *)gesture{
    NSLog(@"view tapped");
    
    UIColor *color = ([self.squareView.backgroundColor isEqual: [UIColor purpleColor]]) ? [UIColor orangeColor] : [UIColor purpleColor];

    [UIView animateWithDuration:2 animations:^{
        self.squareView.backgroundColor = color;
    }];
    
    
}

@end

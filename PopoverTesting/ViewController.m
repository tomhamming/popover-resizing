//
//  ViewController.m
//  PopoverTesting
//
//  Created by Hamming, Tom on 9/29/15.
//  Copyright © 2015 Olive Tree Bible Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.navigationController)
    {
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Push" style:UIBarButtonItemStylePlain target:self action:@selector(onPush)];
        self.navigationItem.rightBarButtonItem = item;
        self.navigationItem.title = NSStringFromCGSize(self.preferredContentSize);
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
}

-(void)onPush
{
    ViewController *vc = [[ViewController alloc]initWithNibName:nil bundle:nil];
    vc.preferredContentSize = CGSizeMake(320, self.preferredContentSize.height + 100);
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)onPopover
{
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    vc.preferredContentSize = CGSizeMake(320, 300);
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationPopover;
    nav.popoverPresentationController.sourceRect = self.popButton.bounds;
    nav.popoverPresentationController.sourceView = self.popButton;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

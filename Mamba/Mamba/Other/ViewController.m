//
//  ViewController.m
//  Mamba
//
//  Created by Bryant Reyn on 2021/2/16.
//  Copyright © 2021 Bryant Reyn. All rights reserved.
//

#import "ViewController.h"
#import "MambaLogoView.h"

@interface ViewController ()
@property (nonatomic,strong)MambaLogoView *logoView; // logo视图
@end

@implementation ViewController
#pragma mark - Lazy-Init
- (MambaLogoView *)logoView{
    if (!_logoView) {
        _logoView = [[MambaLogoView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    }
    return _logoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.logoView];
}


@end

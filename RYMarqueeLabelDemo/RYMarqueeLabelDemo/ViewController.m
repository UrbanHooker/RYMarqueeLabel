//
//  ViewController.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "ViewController.h"
#import "RYMarqueeLabel.h"
#import "UIView+RYMarquee.h"

@interface ViewController ()

@property (nonatomic, strong) RYMarqueeLabel *label1;
@property (nonatomic, strong) RYMarqueeLabel *label2;
@property (nonatomic, strong) RYMarqueeLabel *label3;
@property (nonatomic, strong) RYMarqueeLabel *label4;
@property (nonatomic, strong) RYMarqueeLabel *label5;
@property (nonatomic, strong) RYMarqueeLabel *label6;
@property (nonatomic, strong) RYMarqueeLabel *label7;
@property (nonatomic, strong) RYMarqueeLabel *label8;

@property (nonatomic, strong) UIButton *changeLabel8;
@property (nonatomic, strong) UISwitch *switchEffect;

@end

@implementation ViewController

static CGFloat const edge = 50.f;

#pragma mark - LifeCycle & Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RYMarqueeLabel";
    
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    [self.view addSubview:self.label3];
    [self.view addSubview:self.label4];
    [self.view addSubview:self.label5];
    [self.view addSubview:self.label6];
    [self.view addSubview:self.label7];
    [self.view addSubview:self.label8];
    [self.view addSubview:self.changeLabel8];
    [self.view addSubview:self.switchEffect];
    
    [_label1 startAnimation];
    [_label2 startAnimation];
    [_label3 startAnimation];
    [_label4 startAnimation];
    [_label5 startAnimation];
    [_label6 startAnimation];
    [_label7 startAnimation];
    [_label8 startAnimation];
    
}

- (void)changeLabel8Text:(UIButton *)button {
    if (_switchEffect.isOn) {
        _label8.enableRandomEffect = NO;
    }
    else {
        _label8.enableRandomEffect = YES;
    }
    _label8.text = [self p_generateRandomString:10];
    [_label8 startAnimation];
}

#pragma mark - Getters & Setters
- (RYMarqueeLabel *)label1 {
    if(_label1 == nil) {
        _label1           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label1.left      = edge;
        _label1.top       = 100;
        _label1.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label1.textColor = [UIColor blackColor];
        
        _label1.animationDuration = .2f;
        _label1.effect            = kTopToBottom;
    }
    return _label1;
}

- (RYMarqueeLabel *)label2 {
    if(_label2 == nil) {
        _label2           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label2.right     = self.view.width - edge;
        _label2.top       = 100;
        _label2.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label2.textColor = [UIColor brownColor];
        
        _label2.displaiedDuration = 2.f;
        _label2.effect            = kBottomToTop;
    }
    return _label2;
}

- (RYMarqueeLabel *)label3 {
    if(_label3 == nil) {
        _label3           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label3.left      = edge;
        _label3.top       = 200;
        _label3.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label3.textColor = [UIColor purpleColor];
        
        _label3.displaiedDuration = 4.f;
        _label3.effect            = kLeftToRight;
    }
    return _label3;
}

- (RYMarqueeLabel *)label4 {
    if(_label4 == nil) {
        _label4           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label4.right     = self.view.width - edge;
        _label4.top       = 200;
        _label4.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label4.textColor = [UIColor cyanColor];
        
        _label4.displaiedDuration = 7.f;
        _label4.animationDuration = .9f;
        _label4.effect            = kRightToLeft;
    }
    return _label4;
}

- (RYMarqueeLabel *)label5 {
    if(_label5 == nil) {
        _label5           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label5.left      = edge;
        _label5.top       = 300;
        _label5.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label5.textColor = [UIColor grayColor];
        
        _label5.effect = kDissolve;
    }
    return _label5;
}

- (RYMarqueeLabel *)label6 {
    if(_label6 == nil) {
        _label6           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label6.right     = self.view.width - edge;
        _label6.top       = 300;
        _label6.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label6.textColor = [UIColor blueColor];
        
        _label6.effect = kFlip;
    }
    return _label6;
}

- (RYMarqueeLabel *)label7 {
    if(_label7 == nil) {
        _label7           = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        _label7.left      = edge;
        _label7.top       = 400;
        _label7.texts     = @[@"Hi", @"How are u", @"I'm fine", @"Thank u", @"And u", @"I'm fine too", @"How old r u", @"y", @"233333333", @"I'm the longest text in the world", @"I'm the shortest", @"Yeah"];
        _label7.textColor = [UIColor redColor];
        
        _label7.displaiedDuration  = 2.f;
        _label7.enableRandomEffect = YES;
    }
    return _label7;
}

- (RYMarqueeLabel *)label8 {
    if(_label8 == nil) {
        _label8      = [[RYMarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
        _label8.left = edge;
        _label8.top  = 500;
        _label8.text = [self p_generateRandomString:10];
        
        _label8.font               = [UIFont boldSystemFontOfSize:21];
        _label8.enableRandomEffect = YES;
    }
    return _label8;
}

- (UIButton *)changeLabel8 {
    if(_changeLabel8 == nil) {
        _changeLabel8                    = [[UIButton alloc] init];
        _changeLabel8.frame              = CGRectMake(0, 0, 80, 40);
        _changeLabel8.centerY            = self.label8.centerY;
        _changeLabel8.right              = self.view.width - edge;
        _changeLabel8.layer.cornerRadius = 5.f;
        _changeLabel8.backgroundColor    = [UIColor purpleColor];
        
        [_changeLabel8 setTitle:@"ClickMe" forState:UIControlStateNormal];
        [_changeLabel8 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_changeLabel8 addTarget:self action:@selector(changeLabel8Text:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeLabel8;
}

- (UISwitch *)switchEffect {
    if(_switchEffect == nil) {
        _switchEffect             = [[UISwitch alloc] init];
        _switchEffect.frame       = self.changeLabel8.frame;
        _switchEffect.centerX     = self.changeLabel8.centerX;
        _switchEffect.top         = self.changeLabel8.bottom + 30;
        _switchEffect.tintColor   = [UIColor purpleColor];
        _switchEffect.onTintColor = [UIColor purpleColor];
    }
    return _switchEffect;
}

#pragma mark - Helper
- (NSString*)p_generateRandomString:(NSInteger)wordLength {
    NSMutableString* string = [NSMutableString stringWithCapacity:wordLength];
    for (int i              = 0; i < wordLength; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}


@end

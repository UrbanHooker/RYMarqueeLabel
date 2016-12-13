# RYMarqueeLabel
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)](https://raw.githubusercontent.com/UrbanHooker/RYMarqueeLabel/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/RYMarqueeLabel.svg?style=flat-square)](http://cocoapods.org/?q=RYMarqueeLabel)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/RYMarqueeLabel.svg?style=flat-square)](http://cocoapods.org/?q=RYMarqueeLabel)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat-square)](https://www.apple.com/nl/ios/)&nbsp;

A UILabel with marquee effect

![label](https://github.com/UrbanHooker/RYMarqueeLabel/blob/master/RYMarqueeLabelDemo/RYMarqueeLabelDemo/demo.gif?raw=true)

#Installing
##CocoaPods
1. Add `pod 'RYMarqueeLabel'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import "RYMarqueeLabel.h".


##Manually
1. Drag the `RYMarqueeLabel` folder to your project.
2. Import "RYMarqueeLabel.h".

#Usage

If you want to know more details, please reference to the demo :]

```objective-c
#import "RYSunRefreshControl.h"

@property (nonatomic, strong) RYMarqueeLabel *label;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.label startAnimation];//< dont't forget call this func
}

- (RYMarqueeLabel *)label {
    if(_label) return _label;
    
    _label = [[RYMarqueeLabel alloc] initWithFrame:(CGRect){.size = {100, 50}}];
    
    // if you just want to set a single text
    _label.text = @"Some words";
    _label.textColor = [UIColor grayColor];
    _label.font = [UIFont systemFontOfSize:17.f];
    ...
    
    // if you have a text array and want to loop it or not
    _label.texts = @[@"Hi", @"How are u", @"I'm fine"];
    _label.enabelLoop = YES;
    
    // if you want to modify the animation durition
    _label.displaiedDuration  = 2.f;
    _label.animationDuration = 5.f;
    
	 // if you want to change the default animation effect
	 _label.effect = kBottomToTop;
    
    return _sunRefreshControl;
}

```

#ChangeLog
##Version: 1.0.1
Fix a bug
##Version: 1.0.0
Initial Build
#License
MIT License



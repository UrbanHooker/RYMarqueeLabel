//
//  RYMarqueeLabel.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "Queue.h"
#import "RYMarqueeLabel.h"
#import "UILabel+RYMarquee.h"
#import "RYAnimationContext.h"

@interface RYMarqueeLabel ()

@property (nonatomic, strong) RYAnimator *animator;
@property (nonatomic, strong) Queue      *labelQueue;

@end

@implementation RYMarqueeLabel {
    NSTimer *_timer;
}

#pragma mark - LifeCycle & Init
- (instancetype)init {
    self = [super init];
    if (!self) return self;
    
    self.frame = (CGRect){.size = {100, 50}};
    
    [self p_reset];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    
    [self p_reset];
    return self;
}

- (void)dealloc {
    [self endLoopTimer];
}

#pragma mark - Instance Method
- (void)startAnimation {
    
    if (_texts.count>0) {
        
        [self startLoopTimer];
    }
    else {
        
        [self p_animateForOnce];
    }
}

#pragma mark - Timer
- (void)startLoopTimer {
    [_timer invalidate];
    _timer = [NSTimer timerWithTimeInterval:_displaiedDuration target:self selector:@selector(marqueeLoop) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)endLoopTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)marqueeLoop {
    
    static NSInteger textsLoopPtr = 0;
    
    if (textsLoopPtr == _texts.count) {
        if (_enableLoop) {
            textsLoopPtr = 0;
        }
        else {
            [self endLoopTimer];
            return;
        }
    }
    
    id str = [_texts objectAtIndex:textsLoopPtr++];
    if ([str isKindOfClass:[NSString class]]) {
        _text           = str;
        _attributedText = nil;
    }
    else if ([str isKindOfClass:[NSAttributedString class]]) {
        _attributedText = str;
        _text           = nil;
    }
    else NSLog(@"RYMarqueeLabel texts array should be kind of NSString, please check");
    
    [self p_animateForOnce];
}

#pragma mark - Helper
- (void)p_animateForOnce {
    
    UILabel *_displaiedLabel     = [_labelQueue dequeue];
    UILabel *_willDisplaiedLabel = [_labelQueue dequeue];
    
    [_labelQueue enqueue:_willDisplaiedLabel];
    [_labelQueue enqueue:_displaiedLabel];
    
    [self p_setupLabelWithWillDisplaiedLabel:_willDisplaiedLabel];
    
    [self p_setupAnimatorWithDisplaiedView:_displaiedLabel
                      andWillDisplaiedView:_willDisplaiedLabel];
    
    [_animator startAnimationWithCompletionBlock:_completionBlock];
}

- (void)p_setupLabelWithWillDisplaiedLabel:(UILabel *)_willDisplaiedLabel {
    
    if (_attributedText) {
        
        [_willDisplaiedLabel makeMarqueeLabelWithAttributeText:_attributedText
                                          highlightedTextColor:_highlightedTextColor
                                           textBackgroundColor:_textBackgroundColor
                                                 numberOfLines:_numberOfLines
                                                   highlighted:_highlighted
                                                        enable:_enabled];
    }
    else {
        
        [_willDisplaiedLabel makeMarqueeLabelWithText:_text
                                                 font:_font
                                            textColor:_textColor
                                          shadowColor:_shadowColor
                                  textBackgroundColor:_textBackgroundColor
                                        textAlignment:_textAlignment
                                        lineBreakMode:_lineBreakMode
                                 highlightedTextColor:_highlightedTextColor
                                        numberOfLines:_numberOfLines
                                          highlighted:_highlighted
                                               enable:_enabled];
    }
}

- (void)p_setupAnimatorWithDisplaiedView:(UILabel *)_displaiedLabel
                    andWillDisplaiedView:(UILabel *)_willDisplaiedLabel {
    
    _animator.context = [RYAnimationContext contextWithDisplaiedView:_displaiedLabel
                                                   willDisplaiedView:_willDisplaiedLabel
                                                       containerView:self];
    
    _animator.durition = _animationDuration;
    
    if (_enableRandomEffect) {
        
        NSUInteger whichEffect  = (arc4random() % (kAllEffects.count));
        NSString *choosedEffect = [kAllEffects objectAtIndex:whichEffect];
        _animator.effect        = choosedEffect;
    }
    else {
        _animator.effect = _effect;
    }
}

- (void)p_reset {
    
    self.clipsToBounds = YES;
    
    _text                = @"";
    _font                = [UIFont systemFontOfSize:14.f];
    _textColor           = [UIColor blackColor];
    _numberOfLines       = 0;
    _textBackgroundColor = [UIColor clearColor];
    
    _displaiedDuration  = 5.f;
    _enableLoop         = YES;
    _effect             = kTopToBottom;
    _enableRandomEffect = NO;
    
    _labelQueue = [[Queue alloc] init];
    [_labelQueue enqueue:[[UILabel alloc] initWithFrame:self.bounds]];
    [_labelQueue enqueue:[[UILabel alloc] initWithFrame:self.bounds]];
    
    _animator          = [[RYAnimator alloc] init];
    _animationDuration = .6f;
}

#pragma mark - Description
- (NSString *)description {
    return [NSString stringWithFormat:@"<texts>:%@   <enableLoop>:%@   <displaiedDuration>:%f  <animationDuration>:%f   <effect>:%@   <text>:%@   <font>:%@   <attributedText>:%@", _texts, _enableLoop == YES ? @"YES" : @"NO", _displaiedDuration, _animationDuration, _effect, _text, _font, _attributedText];
}

@end

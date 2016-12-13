//
//  RYMarqueeLabel.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYAnimator.h"

@interface RYMarqueeLabel : UIView

//--------- RYMarqueeLabel attributes ---------

/**
 Texts for looping the marquee label.
 
 @discussion You can set an text array to MarqueeLabel, and if you want to
 just loop for once, set enableLoop property to NO; If you set this texts
 property, the text and attributeText in UILabel property will be ignored
 except other properties like font, textColor, shadowColor and so on.
 */
@property (nonatomic, strong) NSArray<__kindof NSString*> *texts;

/**
 Enabel loop when the text array has been set.
 
 @discussion Default is YES
 */
@property (nonatomic, assign, getter = isEnableLoop) BOOL enableLoop;

/**
 The time durition for how long a text displaied.
 
 @discussion Default is 5.0
 */
@property (nonatomic, assign) NSTimeInterval displaiedDuration;

/**
 The time durition for how long a text animate to another text.
 
 @discussion Default is 0.6
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 The animation effect for displaying a text.
 
 @discussion Reference to RYAnimationEffectKey.h
 */
@property (nonatomic, copy  ) NSString *effect;

/**
 This property will ignore the effect you set.
 
 @discussion If set to YES, the effect will be random. Default is NO
 */
@property (nonatomic, assign) BOOL enableRandomEffect;

/**
 A completion block executed when an animation completed.
 
 @discussion Reference to RYAnimationEffectKey.h
 */
@property (nonatomic, copy  ) CompletionBlock completionBlock;

/**
 The background color of the each text that is going to appear.
 
 @discussion Default is clearColor
 */
@property (nonatomic, strong) UIColor *textBackgroundColor;

//--------- UILabel attributes ---------

@property (nonatomic, copy  ) NSString           *text;
@property (nonatomic, strong) UIFont             *font;
@property (nonatomic, strong) UIColor            *textColor;
@property (nonatomic, strong) UIColor            *shadowColor;
@property (nonatomic, assign) CGSize             shadowOffset;
@property (nonatomic, assign) NSTextAlignment    textAlignment;
@property (nonatomic, assign) NSLineBreakMode    lineBreakMode;
@property (nonatomic, copy  ) NSAttributedString *attributedText;
@property (nonatomic, strong) UIColor            *highlightedTextColor;
@property (nonatomic, assign) NSInteger          numberOfLines;

@property (nonatomic, getter = isHighlighted) BOOL highlighted;
@property (nonatomic, getter = isEnabled)     BOOL enabled;

/**
 Start the marqueeLabel animation or loop.
 
 @discussion After you have set all the properties you need above,
 you need to call this function manully to start the animation
 */
- (void)startAnimation;

@end

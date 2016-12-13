//
//  UILabel+RYMarquee.h
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RYMarquee)
- (void)makeMarqueeLabelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor
                     shadowColor:(UIColor *)shadowColor
             textBackgroundColor:(UIColor *)textBackgroundColor
                   textAlignment:(NSTextAlignment)textAlignment
                   lineBreakMode:(NSLineBreakMode)lineBreakMode
            highlightedTextColor:(UIColor *)highlightedTextColor
                   numberOfLines:(NSInteger)numberOfLines
                     highlighted:(BOOL)highlighted
                          enable:(BOOL)enabel;

- (void)makeMarqueeLabelWithAttributeText:(NSAttributedString *)text
                     highlightedTextColor:(UIColor *)highlightedTextColor
                      textBackgroundColor:(UIColor *)textBackgroundColor
                            numberOfLines:(NSInteger)numberOfLines
                              highlighted:(BOOL)highlighted
                                   enable:(BOOL)enabel;

@end

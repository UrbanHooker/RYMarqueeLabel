//
//  UILabel+RYMarquee.m
//  RYMarqueeLabelDemo
//
//  Created by Roy Miller on 16/12/12.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "UILabel+RYMarquee.h"

@implementation UILabel (RYMarquee)

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
                          enable:(BOOL)enabel {
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = shadowColor;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = textAlignment;
    style.lineBreakMode = lineBreakMode;
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName:textColor, NSShadowAttributeName: shadow, NSParagraphStyleAttributeName: style}];
    
    [self makeMarqueeLabelWithAttributeText:attrText
                       highlightedTextColor:highlightedTextColor
                        textBackgroundColor:textBackgroundColor
                              numberOfLines:numberOfLines
                                highlighted:highlighted
                                     enable:enabel];
    
}

- (void)makeMarqueeLabelWithAttributeText:(NSAttributedString *)text
                     highlightedTextColor:(UIColor *)highlightedTextColor
                      textBackgroundColor:(UIColor *)textBackgroundColor
                            numberOfLines:(NSInteger)numberOfLines
                              highlighted:(BOOL)highlighted
                                   enable:(BOOL)enabel {
    
    self.attributedText       = text;
    self.highlightedTextColor = highlightedTextColor;
    self.numberOfLines        = numberOfLines;
    self.highlighted          = highlighted;
    self.enabled              = enabel;
    self.backgroundColor      = textBackgroundColor;
    
}

@end

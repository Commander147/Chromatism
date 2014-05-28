//
//  Chromatism.m
//  Chromatism
//
//  Created by Johannes Lund on 2013-07-01.
//  Copyright (c) 2013 Johannes Lund
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.//

#import "Chromatism+Internal.h"
#import "ChromatismMacros.h"

NSString *const JLTokenTypeText = @"text";
NSString *const JLTokenTypeBackground = @"background";
NSString *const JLTokenTypeComment = @"comment";
NSString *const JLTokenTypeDocumentationComment = @"documentation_comment";
NSString *const JLTokenTypeDocumentationCommentKeyword = @"documentation_comment_keyword";
NSString *const JLTokenTypeString = @"string";
NSString *const JLTokenTypeCharacter = @"character";
NSString *const JLTokenTypeNumber = @"number";
NSString *const JLTokenTypeKeyword = @"keyword";
NSString *const JLTokenTypePreprocessor = @"preprocessor";
NSString *const JLTokenTypeURL = @"url";
NSString *const JLTokenTypeAttribute = @"attribute";
NSString *const JLTokenTypeProject = @"project";
NSString *const JLTokenTypeOther = @"other";
NSString *const JLTokenTypeOtherMethodNames = @"other_method_names";
NSString *const JLTokenTypeOtherClassNames = @"other_class_names";
NSString *const JLTokenTypeProjectMethodNames = @"project_method_names";
NSString *const JLTokenTypeProjectClassNames = @"project_class_names";


NSString *const JLTokenTypeDiffAddition = @"diff_addition";
NSString *const JLTokenTypeDiffDeletion = @"diff_deletion";

NSString *const JLDiffColorAttributeName = @"diff_color_attribute_name";


@implementation Chromatism


+ (NSDictionary *)colorsForTheme:(JLTokenizerTheme)theme
{
    NSDictionary* colors;
    switch(theme) {
        case JLTokenizerThemeDefault:
            colors = @{JLTokenTypeText:                         [UIColor whiteColor],
                       JLTokenTypeBackground:                   UIColorRGB(255, 255, 255),
                       JLTokenTypeComment:                      UIColorRGB(0, 131, 39),
                       JLTokenTypeDocumentationComment:         UIColorRGB(0, 131, 39),
                       JLTokenTypeDocumentationCommentKeyword:  UIColorRGB(0, 76, 29),
                       JLTokenTypeString:                       UIColorRGB(211, 45, 38),
                       JLTokenTypeCharacter:                    UIColorRGB(40, 52, 206),
                       JLTokenTypeNumber:                       UIColorRGB(40, 52, 206),
                       JLTokenTypeKeyword:                      UIColorRGB(188, 49, 156),
                       JLTokenTypePreprocessor:                 UIColorRGB(120, 72, 48),
                       JLTokenTypeURL:                          UIColorRGB(21, 67, 244),
                       JLTokenTypeOther:                        UIColorRGB(113, 65, 163),
                       JLTokenTypeOtherMethodNames :            UIColorRGB(112, 64, 166),
                       JLTokenTypeOtherClassNames :             UIColorRGB(112, 64, 166),
                       JLTokenTypeProjectClassNames :           UIColorRGB(63, 110, 116),
                       JLTokenTypeProjectMethodNames :          UIColorRGB(38, 71, 75),
                       
                       JLTokenTypeDiffAddition :                [UIColor greenColor],
                       JLTokenTypeDiffDeletion :                [UIColor redColor]
                       
                       };
            break;
        case JLTokenizerThemeDusk:
            colors = @{JLTokenTypeText:                         [UIColor whiteColor],
                       JLTokenTypeBackground:                   UIColorRGB(30, 32, 40),
                       JLTokenTypeComment:                      UIColorRGB(72, 190, 102),
                       JLTokenTypeDocumentationComment:         UIColorRGB(72, 190, 102),
                       JLTokenTypeDocumentationCommentKeyword:  UIColorRGB(72, 190, 102),
                       JLTokenTypeString:                       UIColorRGB(230, 66, 75),
                       JLTokenTypeCharacter:                    UIColorRGB(139, 134, 201),
                       JLTokenTypeNumber:                       UIColorRGB(139, 134, 201),
                       JLTokenTypeKeyword:                      UIColorRGB(195, 55, 149),
                       JLTokenTypePreprocessor:                 UIColorRGB(198, 124, 72),
                       JLTokenTypeURL:                          UIColorRGB(35, 63, 208),
                       JLTokenTypeOther:                        UIColorRGB(0, 175, 199),
                       JLTokenTypeOtherClassNames :             UIColorRGB(4,175,200),
                       JLTokenTypeOtherMethodNames :            UIColorRGB(4,175,200),
                       JLTokenTypeProjectMethodNames :          UIColorRGB(131, 192, 87),
                       JLTokenTypeProjectClassNames :           UIColorRGB(131, 192, 87),
                       
                       JLTokenTypeDiffAddition :                [UIColor greenColor],
                       JLTokenTypeDiffDeletion :                [UIColor redColor]
                       
                       };
            break;
    }
    return colors;
}

@end

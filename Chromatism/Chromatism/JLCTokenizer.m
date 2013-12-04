//
//  JLCTokenizer.m
//  Chromatism
//
//  Created by Johannes Lund on 2013-12-04.
//  Copyright (c) 2013 Anviking. All rights reserved.
//

#import "JLCTokenizer.h"

@implementation JLCTokenizer

- (void)prepareDocumentScope:(JLScope *)documentScope
{
    [super prepareDocumentScope:documentScope];
    
    JLTokenPattern *blockComment = [self addToken:JLTokenTypeComment withPattern:@"" andScope:documentScope];
    blockComment.expression = [NSRegularExpression regularExpressionWithPattern:@"/\\*.*?\\*/" options:NSRegularExpressionDotMatchesLineSeparators error:nil];
}

- (void)prepareLineScope:(JLScope *)lineScope
{
    [super prepareLineScope:lineScope];
    
    [self addToken:JLTokenTypeComment withPattern:@"//.*+$" andScope:lineScope];
    
    JLTokenPattern *preprocessor = [self addToken:JLTokenTypePreprocessor withPattern:@"^#.*+$" andScope:lineScope];
    
    // #import <Library/Library.h>
    [self addToken:JLTokenTypeString withPattern:@"<.*?>" andScope:preprocessor];
    
    // Strings
    [[self addToken:JLTokenTypeString withPattern:@"(\"|@\")[^\"\\n]*(@\"|\")" andScope:lineScope] addScope:preprocessor];
    
    // Numbers
    [self addToken:JLTokenTypeNumber withPattern:@"(?<=\\s)\\d+" andScope:lineScope];
    
    // New literals, for example @[]
    [[self addToken:JLTokenTypeNumber withPattern:@"@[\\[|\\{|\\(]" andScope:lineScope] setOpaque:NO];
    
    // Function names
    [[self addToken:JLTokenTypeOtherMethodNames withPattern:@"\\w+\\s*(?>\\(.*\\)" andScope:lineScope] setCaptureGroup:1];
    
    NSString *keywords = @"true false yes no YES TRUE FALSE bool BOOL nil id void self NULL if else strong weak nonatomic atomic assign copy typedef enum auto break case const char continue do default double extern float for goto int long register return short signed sizeof static struct switch typedef union unsigned volatile while nonatomic atomic nonatomic readonly super";
    
    [self addToken:JLTokenTypeKeyword withKeywords:keywords andScope:lineScope];
}

- (JLTokenizerIntendtationAction)intendationActionAfterReplacingTextInRange:(NSRange)range replacementText:(NSString *)text previousCharacter:(unichar)character textView:(UITextView *)textView;
{
    if (character == '{') {
        return JLTokenizerIntendtationActionIncrease;
    } else if (character == '}') {
        return JLTokenizerIntendtationActionDecrease;
    } else {
        return JLTokenizerIntendtationActionNone;
    }
}

@end

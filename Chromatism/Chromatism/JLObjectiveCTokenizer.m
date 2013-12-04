//
//  JLObjectiveCTokenizer.m
//  Chromatism
//
//  Created by Johannes Lund on 2013-11-19.
//  Copyright (c) 2013 Anviking. All rights reserved.
//

#import "JLObjectiveCTokenizer.h"

@implementation JLObjectiveCTokenizer

- (void)prepareDocumentScope:(JLScope *)documentScope
{
    [super prepareDocumentScope:documentScope];
}

- (void)prepareLineScope:(JLScope *)lineScope
{
    [super prepareLineScope:lineScope];
    
    // Dot notation
    [[self addToken:JLTokenTypeOtherMethodNames withPattern:@"\\.(\\w+)" andScope:lineScope] setCaptureGroup:1];
    
    // Method Calls
    [[self addToken:JLTokenTypeOtherMethodNames withPattern:@"(\\w+)\\]" andScope:lineScope] setCaptureGroup:1];
    
    // Method call parts
    [[self addToken:JLTokenTypeOtherMethodNames withPattern:@"(?<=\\w+):" andScope:lineScope] setCaptureGroup:0];
    
    [self addToken:JLTokenTypeKeyword withPattern:@"@[a-zA-Z0-9_]+" andScope:lineScope];
    
    // Other Class Names
    [self addToken:JLTokenTypeOtherClassNames withPattern:@"\\b[A-Z]{3}[a-zA-Z]*\\b" andScope:lineScope];
}

#pragma mark - Symbolication

- (void)prepareSymbolicateScope:(JLScope *)scope
{
    //NSString *pattern = [NSString stringWithFormat:@"\\b(%@)\\b", [[self symbolsWithPattern:@"^@implementation (\\w+)" captureGroup:1 textStorage:scope.textStorage] componentsJoinedByString:@"|"]];
    //JLTokenizer *pattern = [JLTokenPattern tokenPatternWithRegularExpression:[NSRegularExpression regularExpressionWithPattern:pattern options:0 error:NULL]];

// [self.scopes[PROJECT_METHOD_NAMES] setPattern:[NSString stringWithFormat:@"\\b(%@)\\b", [[self symbolsWithPattern:@"^@property \\(.*?\\)\\s*\\w+[\\s*]+(\\w+);" captureGroup:1] componentsJoinedByString:@"|"]]];
 }

- (JLTokenizerIntendtationAction)intendationActionAfterReplacingTextInRange:(NSRange)range replacementText:(NSString *)text previousCharacter:(unichar)character textView:(UITextView *)textView;
{
    return [super intendationActionAfterReplacingTextInRange:range replacementText:text previousCharacter:character textView:textView];
}

@end

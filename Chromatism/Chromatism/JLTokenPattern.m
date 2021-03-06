 //
//  JLTokenPattern.m
//  iGitpad
//
//  Created by Johannes Lund on 2013-06-30.
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

#import "JLTokenPattern.h"
#import "Helpers.h"

@interface JLScope ()
- (BOOL)shouldPerform;
@property (nonatomic, strong) NSMutableIndexSet *backupSet;
@property (nonatomic, readwrite, strong) NSString *string;
@end

@implementation JLTokenPattern

#pragma mark - Initialization

static NSCache *cache;

+ (instancetype)tokenPatternWithRegularExpression:(NSRegularExpression *)expression;
{
    JLTokenPattern *tokenPattern = [JLTokenPattern new];
    tokenPattern.expression = expression;
    
    return tokenPattern;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.opaque = YES;
        self.captureGroup = 0;
    }
    return self;
}

#pragma mark - Perform

- (void)performInIndexSet:(NSMutableIndexSet *)set
{
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : self.color };
    NSAssert(attributes, @"");
    [set enumerateRangesUsingBlock:^(NSRange range, BOOL *stop) {
        [self.expression enumerateMatchesInString:self.string options:self.matchingOptions range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.textStorage addAttributes:attributes range:[result rangeAtIndex:self.captureGroup]];
            });
            [self.set addIndexesInRange:[result rangeAtIndex:self.captureGroup]];
        }];
    }];
}

#pragma mark - Debugging

- (NSString *)description
{
    NSString *subscopes = [[[[self.dependencies valueForKey:@"description"] componentsJoinedByString:@"\n"] componentsSeparatedByString:@"\n"] componentsJoinedByString:@"\n\t\t"];
    return [NSString stringWithFormat:@"%@, %@, Regex Pattern: %@, opaque: %i, indexesSet:%@ \nsubscopes, %@", NSStringFromClass(self.class), self.identifier, self.expression, self.opaque, self.set, subscopes];
}

@end

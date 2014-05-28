//
//  JLTokenizerTests.m
//  Chromatism
//
//  Created by Anviking on 2013-07-31.
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

#import <XCTest/XCTest.h>
#import "Chromatism.h"
#import "JLTokenizer.h"

@interface JLTokenizer ()
- (JLTokenPattern *)addToken:(NSString *)type withPattern:(NSString *)pattern andScope:(JLScope *)scope;
@end

@interface JLTokenizerTests : XCTestCase

@end

@implementation JLTokenizerTests
{
    JLTokenizer *tokenizer;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    tokenizer = [[JLTokenizer alloc] init];
    tokenizer.colors = [Chromatism colorsForTheme:JLTokenizerThemeDefault];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//
//- (NSTimeInterval)timeOfTokenizingString:(NSString *)string multiplied:(NSInteger)multiplier
//{
//    string = [string stringByPaddingToLength:(string.length * multiplier) withString:string startingAtIndex:0];
//    NSTextStorage *storage = [[NSTextStorage alloc] initWithString:string];
//    NSDate *date = [NSDate date];
//    [tokenizer tokenizeTextStorage:storage withRange:NSMakeRange(0, string.length)];
//    return ABS([date timeIntervalSinceNow]);
//}
//
//- (NSTimeInterval)timeOfTokenizingString:(NSString *)string range:(NSRange)range multiplied:(NSInteger)multiplier
//{
//    string = [string stringByPaddingToLength:(string.length * multiplier) withString:string startingAtIndex:0];
//    NSTextStorage *storage = [[NSTextStorage alloc] initWithString:string];
//    NSDate *date = [NSDate date];
//    [tokenizer tokenizeTextStorage:storage withRange:range];
//    return ABS([date timeIntervalSinceNow]);
//}
//
///*
//- (void)testAndPlotLater
//{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *URL = [bundle URLForResource:@"demo" withExtension:@"txt"];
//    NSString *string = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:URL] encoding:NSUTF8StringEncoding];
//    NSMutableString *result = [[NSMutableString alloc] init];
//    for (int i = 1; i<50; i++) {
//        NSTimeInterval interval = [self timeOfTokenizingString:string multiplied:i];
//        [result appendFormat:@"%f,",interval];
//    }
//    NSLog(@"Result:%@",result);
//}
// */
//
//- (void)testLargeFilePerformance
//{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *URL = [bundle URLForResource:@"demo" withExtension:@"txt"];
//    NSString *string = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:URL] encoding:NSUTF8StringEncoding];
//    NSTimeInterval interval = [self timeOfTokenizingString:string multiplied:10];
//    NSLog(@"\n\nLarge file tokenizing: %fms\n\n", interval*1000);
//}
//
//- (void)testSmallEditPerformance
//{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    NSURL *URL = [bundle URLForResource:@"demo" withExtension:@"txt"];
//    NSString *string = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:URL] encoding:NSUTF8StringEncoding];
//    NSTimeInterval interval = [self timeOfTokenizingString:string range:[string lineRangeForRange:NSMakeRange(500, 5)] multiplied:1];
//    NSLog(@"\n\nLine edit Performance: %fms\n\n", interval*1000);
//}

@end

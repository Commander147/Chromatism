//
//  JLScope.h
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

#import <UIKit/UIKit.h>

@interface JLScope : NSOperation

// Designated initializors
+ (instancetype)scopeWithRange:(NSRange)range inTextStorage:(NSTextStorage *)textStorage;
+ (instancetype)scopeWithTextStorage:(NSTextStorage *)textStorage;

@property (nonatomic, strong) NSMutableIndexSet *set;

/// Used by subclasses
- (void)performInIndexSet:(NSMutableIndexSet *)set;

- (void)addSubscope:(JLScope *)scope;
- (void)addScope:(JLScope *)scope;

/// Returns a set of ALL subscopes recursivly. The instance-scope adds itself to the set as well.
- (NSMutableSet *)recursiveSubscopes;

/// NSHashTable with weak references to parent scopes
@property (nonatomic, strong) NSHashTable *scopes;

/// NSMutableArray of strong references to subscopes
@property (nonatomic, strong) NSMutableArray *subscopes;

/**
 *  A weak reference to a textStorage in which the scope is operating. Will be passed down to subscopes.
 */
@property (nonatomic, weak) NSTextStorage *textStorage;

/**
 *  A shared instance of the textStorage's string.
 */
@property (nonatomic, readonly, strong) NSString *string;

/**
 *  Describes wether the instance removes it's indexes from the containg scope. Default is YES.
 */
@property (nonatomic, assign, getter = isOpaque) BOOL opaque;

/**
 *  If TRUE, the instance will act as if its subscopes where connected directly to the instance's parent's scope. 
 */
@property (nonatomic, assign, getter = isEmpty) BOOL empty;

/**
 *  An unique identifier of the scope
 */
@property (nonatomic, assign) NSString *identifier;

/**
 *  What kind of scope is this?
 */
@property (nonatomic, copy) NSString *type;

@end

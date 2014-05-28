//
//  NSIndexSet+JLAdditions.m
//  Chromatism
//
//  Created by Johannes Lund on 2014-05-28.
//  Copyright (c) 2014 Anviking. All rights reserved.
//

#import "NSIndexSet+JLAdditions.h"

@implementation NSIndexSet (JLAdditions)

- (NSMutableIndexSet *)intersectionWithSet:(NSIndexSet *)set
{
    NSMutableIndexSet *finalSet = [NSMutableIndexSet indexSet];
    [self enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop) {
        if ([set containsIndex:index]) [finalSet addIndex:index];
    }];
    
    return finalSet;
}

@end

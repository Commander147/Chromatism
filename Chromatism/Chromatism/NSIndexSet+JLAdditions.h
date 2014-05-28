//
//  NSIndexSet+JLAdditions.h
//  Chromatism
//
//  Created by Johannes Lund on 2014-05-28.
//  Copyright (c) 2014 Anviking. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexSet (JLAdditions)

- (NSMutableIndexSet *)intersectionWithSet:(NSIndexSet *)otherSet;

@end

//
//  MAWeakArray.m
//  ZeroingWeakRef
//
//  Created by Mike Ash on 7/13/10.
//

#import "MAWeakArray.h"

#import "MAZeroingWeakRef.h"


@implementation MAWeakArray

- (id)init
{
    if((self = [super init]))
    {
        _weakRefs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_weakRefs release];
    [super dealloc];
}

- (NSUInteger)count
{
    return [_weakRefs count];
}

- (id)objectAtIndex: (NSUInteger)pos
{
    return [[_weakRefs objectAtIndex: pos] target];
}

- (void)addObject: (id)anObject
{
    [_weakRefs addObject: [MAZeroingWeakRef refWithTarget: anObject]];
}

- (void)insertObject: (id)anObject atIndex: (NSUInteger)pos
{
    [_weakRefs insertObject: [MAZeroingWeakRef refWithTarget: anObject]
                    atIndex: pos];
}

- (void)removeLastObject
{
    [_weakRefs removeLastObject];
}

- (void)removeObjectAtIndex: (NSUInteger)pos
{
    [_weakRefs removeObjectAtIndex: pos];
}

- (void)replaceObjectAtIndex: (NSUInteger)pos withObject: (id)anObject
{
    [_weakRefs replaceObjectAtIndex: pos
                         withObject: [MAZeroingWeakRef refWithTarget: anObject]];
}

@end

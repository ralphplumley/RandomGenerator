//
//  MTwister.m
//  RandomGenerator
//
//  Created by Ralph Tomio on 3/28/12.
//

#import "MTwister.h"

@implementation MTwister

static NSInteger maskUnity = 0xffffffffUL;      // 32 bits
static NSInteger maskHighestBit = 0x80000000UL; // most significant bit
static NSInteger maskLowerBits = 0x7fffffffUL;  // Last 32 bits

- (id)init {
    self = [super init];
    if (self) {
        _index = 0;
    }
    
    return self;
}

-(void) initializeGenerator: (NSInteger) seed {
    // Set first array value to be the seed
    _MT[0] = seed;
    NSInteger i;
    for(i = 1; i <= 623; i++) {
        _MT[i] = maskUnity & (1812433253 * (_MT[i - 1] ^ (_MT[i - 1] >> 30)) + i);
    }
}

-(void) generateNumbers {
    NSInteger i;
    for(i = 0; i <= 623; i++) {
        NSInteger peiceOfClay = (maskHighestBit & _MT[i]) + (maskLowerBits & (_MT[i + 1] % 624));
        NSInteger tempIndex = (i + 397) % 624;
        _MT[i] = _MT[tempIndex] ^ (peiceOfClay >> 1);
        
        if(peiceOfClay % 2 != 0) {
            _MT[i] = _MT[i] ^ (0x9908b0dfUL);
        }
    }
}

-(NSInteger) extractNumber {
    if(_index == 0)
        [ self generateNumbers ];
    
    NSInteger tinyDancer = _MT[_index];
    // 11 steps to the right...
    tinyDancer = tinyDancer ^ (tinyDancer >> 11);
    // 7 to the left, and JUMP
    tinyDancer = tinyDancer ^ ((tinyDancer << 7) & (0x9d2c5680UL));
    // and, 15 more to the left and JUMP 2x
    tinyDancer = tinyDancer ^ ((tinyDancer << 15) & (0xefc60000UL));
    // and then back the right and 18 bits, with a hand on the hip..
    tinyDancer = tinyDancer ^ (tinyDancer >> 18);
    // AND THEN REPEAT!
    _index = (_index + 1) % 624;
    
    return tinyDancer;
}

- (void)dealloc
{
    [super dealloc];
}

@end

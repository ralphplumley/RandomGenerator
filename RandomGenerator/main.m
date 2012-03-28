//
//  main.m
//  RandomGenerator
//
//  Created by Ralph Tomio on 3/28/12.
//

#import <Foundation/Foundation.h>
#import "MTwister.h"

int main (int argc, const char * argv[])
{
    MTwister* randTwist = [ [ MTwister alloc ] init ];
    
    for(NSInteger i = 0; i < 10; i++)
    {
        [ randTwist initializeGenerator: i ];
        NSLog(@"Your random # is %ld\n", [ randTwist extractNumber ]);
    }
    [ randTwist release ];
    return 0;
}



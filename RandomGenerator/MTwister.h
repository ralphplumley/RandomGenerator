//
//  MTwister.h
//  RandomGenerator
//
//  Created by Ralph Tomio on 3/28/12.
//

#import <Foundation/Foundation.h>


@interface MTwister : NSObject {
@private
    NSInteger _MT[624];
    NSInteger _index;
}

-(id) init;
-(void) dealloc;
-(void) initializeGenerator: (NSInteger) seed;
-(void) generateNumbers;
-(NSInteger) extractNumber;

@end

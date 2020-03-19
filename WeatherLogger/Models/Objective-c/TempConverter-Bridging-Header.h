//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
#import <Foundation/Foundation.h>

@interface TempConverter : NSObject

@property double value;

-(instancetype) initWithValue:(double) data;

-(NSString*) tempFormatter:(double) value;

-(NSString*) formatted;

-(NSString*) formatTemp:(double) temp;

@end

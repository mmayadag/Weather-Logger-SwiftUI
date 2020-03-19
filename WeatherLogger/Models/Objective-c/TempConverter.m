//
//  TempConverter.m
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

#import "TempConverter-Bridging-Header.h"

@implementation TempConverter


- (instancetype)init
{
    self = [self initWithValue:0.0];
    return self;
}

- (instancetype)initWithValue:(double) data
{
    self = [super init];
    if (self) {
        _value  = data;
    }
    return self;
}

-(NSString*) tempFormatter:(double) value{
    return [NSString stringWithFormat:@"%.2f", value];
}

// Format double to NSString
-(NSString*) formatted{
    return [self tempFormatter:self.value];
}

- (NSString* )formatTemp:(double) temp{
    return [self tempFormatter:temp];
}

@end

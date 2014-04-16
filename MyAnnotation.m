//
//  MyAnnotation.m
//  BestHope
//
//  Created by Daniel Cetrulo on 20/04/11.
//  Copyright 2011 DLC Diseño Gráfico, Comunicación y Prensa. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation
@synthesize coordinate, title, subtitle;

- (id) initWithDictionary:(NSDictionary *) dict{
	self [super init];
	if(self != nil){
		coordinate.latitude = [[dict objectForKey:@"latitude"] doubleValue]
		coordinate.longitude = [[dict objectForKey:@"longitude"] doubleValue]
		self.title = [dict objectForKey:@"name"];
		self.subtitle = [dict objectForKey:@"address"];
	}
	return self;
}

@end

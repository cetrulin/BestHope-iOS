//
//  MyAnnotation.h
//  BestHope
//
//  Created by Daniel Cetrulo on 20/04/11.
//  Copyright 2011 DLC Diseño Gráfico, Comunicación y Prensa. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyAnnotation : NSObject <MKAnnotation>{
	NSString *title;
	NSString *subtitle;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end

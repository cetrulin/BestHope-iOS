//
//  DescripcionIncidencia.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DescripcionIncidencia : UIViewController {
	IBOutlet UITextView *_texto;
	IBOutlet UIActivityIndicatorView *activity;
	NSTimer *timer;
}

@property(nonatomic,retain)UIActivityIndicatorView *activity;
@property(nonatomic,retain)UITextView *_texto;

-(IBAction)ViewImportarImagen:(id)sender;

-(IBAction)ActivityView:(id)sender;

-(void)ViewReciboIncidencia;


@end

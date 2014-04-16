//
//  ImportOptions.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImportOptions : UIViewController {

	UIBarButtonItem *repetir;
	IBOutlet UIImageView *image;
	int valor;

}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *repetir;

-(IBAction)ViewDescripcion:(id)sender;

-(IBAction)ViewBack:(id)sender;

@end

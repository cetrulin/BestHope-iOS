//
//  ImportarImagen.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImportarImagen : UIViewController {
	IBOutlet UIImageView  *animatedImages;
	NSMutableArray *imageArray;
	UIWindow *window;
	UIView *View;
}

-(IBAction)ViewImportOptions:(id)sender;

-(IBAction)ViewBack:(id)sender;

@end

//
//  ImportarImagen.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "ImportarImagen.h"
#import "ImportOptions.h"
#import "DescripcionIncidencia.h"

#define IMAGE_COUNT       36
#define IMAGE_WIDTH       320
#define IMAGE_HEIGHT      380
#define STATUS_BAR_HEIGHT 20
#define SCREEN_HEIGHT     460
#define SCREEN_WIDTH      320

@implementation ImportarImagen

//-(IBAction)Start:(id)sender{
//	
//	// Array to hold jpg images
//	imageArray = [[NSMutableArray alloc] initWithCapacity:IMAGE_COUNT];
//	
//	// Build array of images, cycling through image names
//	for (int i = 0; i < IMAGE_COUNT; i++)
//		[imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Frame%d.png", i]]];
//	
//	animatedImages.animationImages = [NSArray arrayWithArray:imageArray];
//	
//	[animatedImages setAnimationRepeatCount:-1];
//	animatedImages.animationDuration = 3;
//	[animatedImages startAnimating];
//	
//}



-(IBAction)ViewImportOptions:(id)sender{
	ImportOptions *varImportOptions = [[ImportOptions alloc] initWithNibName:@"ImportOptions" bundle:nil];
	[[self navigationController] pushViewController:varImportOptions animated:NO];
	[ImportOptions release];
}

-(IBAction)ViewBack:(id)sender{
	[self.navigationController popViewControllerAnimated:YES]; 
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationItem setHidesBackButton:YES animated:YES];

//}
//
//- (void)applicationDidFinishLaunching:(UIApplication *) application{    

	
	// Array to hold jpg images
	imageArray = [[NSMutableArray alloc] initWithCapacity:IMAGE_COUNT];
	
	// Build array of images, cycling through image names
	for (int i = 0; i < IMAGE_COUNT; i++){
		[imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Frame%d.png", i]]];
	}
	//    
	//	// Animated images - centered on screen
	//	animatedImages = [[UIImageView alloc] 
	//					  initWithFrame:CGRectMake(
	//											   (SCREEN_WIDTH / 2) - (IMAGE_WIDTH / 2), 
	//											   (SCREEN_HEIGHT / 2) - (IMAGE_HEIGHT / 2) + STATUS_BAR_HEIGHT,
	//											   IMAGE_WIDTH, IMAGE_HEIGHT)];
	
	animatedImages.animationImages = [NSArray arrayWithArray:imageArray];
	[animatedImages setAnimationRepeatCount:-1];
	animatedImages.animationDuration = 3;
	[animatedImages startAnimating];

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[self.navigationItem setHidesBackButton:NO animated:YES];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
	[imageArray release];
	[animatedImages release];
	[window release];
	[super dealloc];
}


@end

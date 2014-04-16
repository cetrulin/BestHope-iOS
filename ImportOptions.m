//
//  ImportOptions.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "ImportOptions.h"
#import "DescripcionIncidencia.h"

#define IMAGE_COUNT       36

@implementation ImportOptions

@synthesize repetir;

-(IBAction)ViewDescripcion:(id)sender{
	[self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:2] animated:YES]; 
}

-(IBAction)ViewBack:(id)sender{
	[self.navigationController popViewControllerAnimated:NO]; 
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
	valor = arc4random()%IMAGE_COUNT;	
	image.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:[NSString stringWithFormat:@"Frame%d.png", valor]], nil];
	[image stopAnimating];		
	[image setAnimationRepeatCount:-1];
	image.animationDuration = -1;
	[image startAnimating];
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


- (void)dealloc {
    [super dealloc];
}


@end

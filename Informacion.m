//
//  Informacion.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "Informacion.h"


@implementation Informacion

- (IBAction)DemoAlertas {
	NSString *msg = [[NSString alloc] initWithFormat:@"¡Alguien necesita urgentemente su ayuda cerca de aquí!"];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Situación de emergencia" message:msg delegate:nil cancelButtonTitle:@"Ver situación" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[msg release];
}

- (IBAction)DemoAlertasTrafico {
	NSString *msg = [[NSString alloc] initWithFormat:@"Ha habido un accidente en una de las calles que toma su ruta."];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Debería cambiar su ruta" message:msg delegate:nil cancelButtonTitle:@"Ver incidencia" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[msg release];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

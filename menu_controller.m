//
//  menu_controller.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 07/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "menu_controller.h"
#import "type_controller.h"
#import "Informacion.h"
#import "Mapa.h"
#import "Incidencias.h"

@implementation menu_controller

-(IBAction)CambiarViewAtipoIncidencia:(id)sender{
	type_controller *varTypeController = [[type_controller alloc] initWithNibName:@"type_controller" bundle:nil];
	[[self navigationController] pushViewController:varTypeController animated:YES];
	[varTypeController release];
}

-(IBAction)ViewInformacion:(id)sender{
	Informacion *varInformacion = [[Informacion alloc] initWithNibName:@"Informacion" bundle:nil];
	[[self navigationController] pushViewController:varInformacion animated:YES];
	[varInformacion release];
}

-(IBAction)ViewIncidencia:(id)sender{
	Incidencias *varIncidencias = [[Incidencias alloc] initWithNibName:@"Incidencias" bundle:nil];
	[[self navigationController] pushViewController:varIncidencias animated:YES];
	[varIncidencias release];
}

-(IBAction)ViewMap:(id)sender{
	Mapa *varMapa = [[Mapa alloc] initWithNibName:@"Mapa" bundle:nil];
	[[self navigationController] pushViewController:varMapa animated:YES];
	[varMapa release];
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
}

- (void) viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:NO]; // hides
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.navigationController setNavigationBarHidden:YES animated:NO]; // hides
}

- (void)dealloc {
    [super dealloc];
}


@end

//
//  DescripcionIncidencia.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "DescripcionIncidencia.h"
#import "ImportarImagen.h"
#import "ReciboIncidencia.h"

@implementation DescripcionIncidencia

@synthesize _texto, activity;


-(IBAction)ViewImportarImagen:(id)sender{
	ImportarImagen *varImportarImagen = [[ImportarImagen alloc] initWithNibName:@"ImportarImagen" bundle:nil];
	[[self navigationController] pushViewController:varImportarImagen animated:YES];
	[ImportarImagen release];
}

-(IBAction)ActivityView:(id)sender{
	[activity setHidden:NO];
	timer = [NSTimer scheduledTimerWithTimeInterval:(2.0/3.0) target:self selector:@selector(ViewReciboIncidencia) userInfo:nil repeats:NO];
}

-(void)ViewReciboIncidencia {
	[activity stopAnimating];
	ReciboIncidencia *varReciboIncidencia = [[ReciboIncidencia alloc] initWithNibName:@"ReciboIncidencia" bundle:nil];
	[[self navigationController] pushViewController:varReciboIncidencia animated:YES];
	[ReciboIncidencia release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[activity setHidden:YES];
	[self._texto becomeFirstResponder];
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Enviar Incidencia" style:UIBarButtonItemStylePlain target:self action:@selector(ActivityView:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
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

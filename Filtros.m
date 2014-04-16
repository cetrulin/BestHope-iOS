//
//  Filtros.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "Filtros.h"


@implementation Filtros

@synthesize Lista;

-(IBAction)AplicarFiltro:(id)sender{
	[self.navigationController popViewControllerAnimated:YES]; 
}

//- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
//}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Aplicar filtro" style:UIBarButtonItemStylePlain target:self action:@selector(AplicarFiltro:)];          
	self.navigationItem.leftBarButtonItem = anotherButton;
	[anotherButton release];
	Lista = [[NSMutableArray alloc] init];	
	[Lista addObject:@"Incendio"];
	[Lista addObject:@"Salud"];
	[Lista addObject:@"Accidente"];
	[Lista addObject:@"Inundación"];
	[Lista addObject:@"Robo"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [Lista count];	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];	
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
	}
	
	NSString *cellValue = [Lista objectAtIndex:indexPath.row];
	cell.textLabel.text = cellValue;
	
	CGRect frameSwitch = CGRectMake(215.0, 10.0, 94.0, 27.0);
	UISwitch *switchEnabled = [[UISwitch alloc] initWithFrame:frameSwitch];
	//UITableViewCell *parentCell = switchEnabled.superview;
	[switchEnabled addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
	
	if(cellValue == @"Incendio" || cellValue == @"Salud" || cellValue == @"Accidente")
		[switchEnabled setOn:TRUE];
	
	//@selector(switchToggled:)
	cell.accessoryView = switchEnabled;
	
	return cell;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	return 50;
	
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

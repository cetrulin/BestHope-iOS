//
//  Incidencias.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "Incidencias.h"
#import "Mapa.h"
#import "Filtros.h"
#import "PropiedadesCeldas.h"
#import "TableViewController.h"
#import "SubViewController.h"

@implementation Incidencias

@synthesize Lista, tblView, svController;

-(IBAction)ViewFiltros:(id)sender{
	Filtros *varFiltros = [[Filtros alloc] initWithNibName:@"Filtros" bundle:nil];
	[[self navigationController] pushViewController:varFiltros animated:YES];
	[Filtros release];
}

-(IBAction)ViewMap:(id)sender{
	Mapa *varMapa = [[Mapa alloc] initWithNibName:@"Mapa" bundle:nil];
	[[self navigationController] pushViewController:varMapa animated:YES];
	[varMapa release];
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}

// Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];	
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Filtrar Incidencias" style:UIBarButtonItemStylePlain target:self action:@selector(ViewFiltros:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	Lista = [[NSMutableArray alloc] init];	
	[Lista addObject:@"Incendio"];
	[Lista addObject:@"Salud"];
	[Lista addObject:@"Accidente"];
}

- (void)dealloc {
	[Lista release];
	[tblView release];
	[svController release];
	[super dealloc];
}

#pragma mark -
#pragma mark <UITableViewDataSource> methods

- (UITableViewCell *)tableView:(UITableView *)tblView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	PropiedadesCeldas *cell = [tblView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
		cell = [[[PropiedadesCeldas alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];	
	
	//NSString *cellValue = [Lista objectAtIndex:indexPath.row];
	//cell.textLabel.text = cellValue;
	
	// Set up the cell…
	switch (indexPath.row) {
			
		case 0:
			
			cell.primaryLabel.text = @"Incendio";
			
			cell.secondaryLabel.text = @"1 incendio cerca";
			
			cell.myImageView.image = [UIImage imageNamed:@"fire_icon.png"];
			
			break;
			
		case 1:
			
			cell.primaryLabel.text = @"Salud";
			
			cell.secondaryLabel.text = @"1 emergencia cerca";
			
			cell.myImageView.image = [UIImage imageNamed:@"hearth.png"];
			
			break;
			
		case 2:
			
			cell.primaryLabel.text = @"Accidente";
			
			cell.secondaryLabel.text = @"1 accidente cerca";
			
			cell.myImageView.image = [UIImage imageNamed:@"accident.png"];
			
			break;
			
			//			
			//		case 3:
			//			
			//			cell.primaryLabel.text = @"Inundación";
			//			
			//			cell.secondaryLabel.text = @"No hay inundaciones cerca";
			//			
			//			cell.myImageView.image = [UIImage imageNamed:nil];
			//			
			//			break;
			//			
			//		case 4:
			//			
			//			cell.primaryLabel.text = @"Robo";
			//			
			//			cell.secondaryLabel.text = @"Sin incidencias cerca";
			//			
			//			cell.myImageView.image = [UIImage imageNamed:nil];
			//			
			//			break;
		default:
			
			break;
			
	}
	
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tblView numberOfRowsInSection:(NSInteger)section {
	
	return [Lista count];	
}

- (CGFloat)tableView:(UITableView *)tblView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 50;	
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDetailDisclosureButton;
}

-(void)tableView:(UITableView *)tblView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Initialize the controller.
	if(svController == nil)
		self.svController = [[SubViewController alloc] initWithNibName:@"SubView" bundle:[NSBundle mainBundle]];
	
	//Pass the current row number to the sub view controller.
	svController.rowNumber = indexPath.row;
	
	//Add the view as a sub view to the urrent view.
	[self.view addSubview:[svController view]];
}

@end

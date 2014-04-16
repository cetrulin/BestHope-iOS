//
//  Incidencias.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubViewController.h"


@interface Incidencias : UIViewController {
	NSMutableArray *Lista;
	UIButton *aButton;
	IBOutlet UITableView *tblView;
	SubViewController *svController;
}

-(IBAction)ViewFiltros:(id)sender;

-(IBAction)ViewMap:(id)sender;

@property(nonatomic, retain)NSMutableArray *Lista;
@property (nonatomic, retain)UITableView *tblView;
@property (nonatomic, retain)SubViewController *svController;

@end

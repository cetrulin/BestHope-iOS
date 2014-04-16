//
//  Filtros.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface Filtros : UIViewController {
	
	NSMutableArray *Lista;
	UIButton *aButton;
	
	UISwitch *incendios;
	UISwitch *salud;
	UISwitch *accidentes;
	UISwitch *inundaciones;
	UISwitch *robos;
}

@property(nonatomic, retain)NSMutableArray *Lista;

-(NSMutableArray *)Lista;

-(IBAction)AplicarFiltro:(id)sender;

@end

//
//  CustomCell.h
//  BestHope
//
//  Created by Daniel Cetrulo on 21/04/11.
//  Copyright 2011 DLC Diseño Gráfico, Comunicación y Prensa. All rights reserved.
//

@interface PropiedadesCeldas : UITableViewCell {	
	UILabel *primaryLabel;	
	UILabel *secondaryLabel;
	UIImageView *myImageView;
}

@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;
@property(nonatomic,retain)UIImageView *myImageView;

@end
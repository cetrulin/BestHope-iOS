//
//  CustomCell.m
//  BestHope
//
//  Created by Daniel Cetrulo on 21/04/11.
//  Copyright 2011 DLC Diseño Gráfico, Comunicación y Prensa. All rights reserved.
//

#import "PropiedadesCeldas.h"


@implementation PropiedadesCeldas

@synthesize primaryLabel,secondaryLabel,myImageView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
		// Initialization code
		
		primaryLabel = [[UILabel alloc]init];
		
		primaryLabel.textAlignment = UITextAlignmentLeft;
		
		primaryLabel.font = [UIFont systemFontOfSize:22];
		
		secondaryLabel = [[UILabel alloc]init];
		
		secondaryLabel.textAlignment = UITextAlignmentLeft;
		
		secondaryLabel.font = [UIFont systemFontOfSize:10];
		
		myImageView = [[UIImageView alloc]init];
		
		[self.contentView addSubview:primaryLabel];
		
		[self.contentView addSubview:secondaryLabel];
		
		[self.contentView addSubview:myImageView];
		
	}
	
	return self;
	
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	CGRect contentRect = self.contentView.bounds;
	
	CGFloat boundsX = contentRect.origin.x;
	
	CGRect frame;
	
	frame= CGRectMake(boundsX+10 ,5, 40, 40);
	
	myImageView.frame = frame;
	
	frame= CGRectMake(boundsX+70 ,5, 200, 25);
	
	primaryLabel.frame = frame;
	
	frame= CGRectMake(boundsX+70 ,30, 100, 15);
	
	secondaryLabel.frame = frame;
	
}


@end

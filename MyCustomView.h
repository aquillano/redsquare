//
//  MyCustomView.h
//  RedSquare
//
//  Created by Steve Aquillano on 3/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCustomView : UIView <UIAccelerometerDelegate>
{
	CGFloat				squareSize;
	CGFloat				rotation;
	CGColorRef			aColor;
	BOOL				twoFingers;
	
	IBOutlet UILabel	*xField;
	IBOutlet UILabel	*yField;
	IBOutlet UILabel	*zField;
}

@end

//
//  MyCustomView.m
//  RedSquare
//
//  Created by Steve Aquillano on 3/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyCustomView.h"


@implementation MyCustomView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib {
	// You have to initialize your view here since it's getting
	// instantiated by the nib
	squareSize = 100.0f;
	twoFingers = NO;
	rotation = 0.5f;
	
	// You have to explicitly turn on multitouch for the view
	self.multipleTouchEnabled = YES;
	
	// Configure for acceleraometer
	[self configureAccelerometer];
}

- (void)configureAccelerometer {
	
	UIAccelerometer *theAcceleromter = [UIAccelerometer sharedAccelerometer];
	
	if(theAcceleromter) {
		
	UIAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
	theAccelerometer.deleget = self;
	}
	else {
		NSLog(@"Oops we're not running on the device!");
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	UIAccelerationValue x, y, z;
	x = acceleration.x;
	y = acceleration.y;
	z = acceleration.z;
	
	// Do something with the values.
	xField.text = [NSString stringWithFormat:@"%.5f", x];
	yField.text = [NSString stringWithFormat:@"%.5f", y];
	zField.text = [NSString stringWithFormat:@"%.5f", z];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches began count %d, %@", [touches count], touches);
	
	// Count returns the number of touches in the set.
	if([touches count] > 1) {
		twoFingers = YES;
	}
	
	// Tell the view to redraw
	[self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches moved count %d, %@", [touches count], touches);
	
	// tell the view to redraw
	[self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches ended count %d, %@", [touches count], touches);
	
	// reset the var
	twoFingers = NO;
	
	// tell the view to redraw
	[self setNeedsDisplay];
}

// Draws the receiver's image within the passed-in rectangle
// rect is a rectangle defining the area to restrict drawing to
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	NSLog(@"drawRect");
	
	CGFloat centerx = rect.size.width/2;
	CGFloat centery = rect.size.height/2;
	CGFloat half = squareSize/2;
	CGRect theRect = CGRectMake(-half, -half, squareSize, squareSize)
	
	// Grab the drawing context
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// like Processing pushMatrix
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, centerx, centery);
	
	// Uncomment to see the rotated square
	//CGContextRotateCTM(context, rotation);
	
	// Set red stroke
	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	
	// Set different based on multitouch
	if (!twoFingers) {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
	} else {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1.0);
	}
	
	// Draw a rect with a red stroke
	CGContextFillRect(context, theRect);
	CGContextStrokeRect(context, theRect);
	
	// like Processing popMatrix
	CGContextRestoreGState(context);
	
}


- (void)dealloc {
    [super dealloc];
}

@end









































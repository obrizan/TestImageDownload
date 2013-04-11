//
//  ViewController.h
//  testImage
//
//  Created by Vladimir Obrizan on 12.04.13.
//  Copyright (c) 2013 Design and Test Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
{
	NSMutableData *_data;
	NSURLConnection *_connection;
	NSUInteger index;
	NSMutableArray *URLs;
}

@end

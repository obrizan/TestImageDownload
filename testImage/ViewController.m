//
//  ViewController.m
//  testImage
//
//  Created by Vladimir Obrizan on 12.04.13.
//  Copyright (c) 2013 Design and Test Lab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	index = 0;
	URLs = [NSMutableArray arrayWithArray:@[
		  @"http://upload.wikimedia.org/wikipedia/commons/3/37/Liceum_building_in_Tsarskoe_Selo_02.jpg",
	@"http://upload.wikimedia.org/wikipedia/commons/a/af/M%C3%A5b%C3%B8dalen%2C_2011_August.jpg",
	@"http://upload.wikimedia.org/wikipedia/commons/a/a0/Power_8_mandelbulb_fractal_overview.jpg"]];
	[self startDownload];
}

-(void)startDownload
{
	if (index < URLs.count)
	{
		NSURL *URL = [NSURL URLWithString:URLs[index]];
		_connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:URL] delegate:self];
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	_data = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	UIImage *image = [UIImage imageWithData:_data];
	_data = nil;
	_connection = nil;
	UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100+index];
	imageView.image = image;
	index++;
	[self startDownload];
}

@end

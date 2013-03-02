//
//  BlocksMainView.h
//  Blocks
//
//  Created by Brent Gulanowski on 11-01-16.
//  Copyright 2011 Marketcircle Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <BAScene/BASceneView.h>


typedef enum {
	kMoveMode,
	kBuildMode,
	kEditMode
} BlocksToolMode;


@interface BlocksMainView : BASceneView {

	BlocksToolMode toolMode;
}

@property (nonatomic) BlocksToolMode toolMode;

@end

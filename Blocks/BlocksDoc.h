//
//  BlocksDoc.h
//  Blocks
//
//  Created by Brent Gulanowski on 30/05/09.
//  Copyright 2009  Bored Astronaut. All rights reserved.
//


@class BlocksMainView, BAScene, BAProp;

@interface BlocksDoc : NSPersistentDocument {

	BlocksMainView *mainView;
	BAScene *scene;
}

@property (nonatomic, assign) IBOutlet BlocksMainView *mainView;

@property (readonly) BAProp *selectedProp;

@end

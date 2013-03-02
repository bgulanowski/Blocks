//
//  BlocksDoc.m
//  Blocks
//
//  Created by Brent Gulanowski on 30/05/09.
//  Copyright 2009  Bored Astronaut. All rights reserved.
//

#import "BlocksDoc.h"

#import "BAPrototype+Blocks.h"
#import "BlocksMainView.h"
#import "BlocksUtilities.h"

#import <BAFoundation/NSManagedObjectContext+BAAdditions.h>

#import <BAScene/BAMesh.h>
#import <BAScene/BAPartition.h>
#import <BAScene/BATexture.h>


@interface BlocksDoc ()

- (void)addInitialContent;

@end



@implementation BlocksDoc

@synthesize mainView;
@dynamic selectedProp;

#pragma mark NSObject
- (id)init {
	self = [super init];
	if(nil != self) {
		[NSManagedObjectContext setActiveContext:[self managedObjectContext]];
		[[self managedObjectContext] setUndoManager:nil];
	}
	return self;
}


#pragma mark NSDocument

#if 0
// TODO: BG
- (BOOL)readFromURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)error {
	if(![super readFromURL:absoluteURL ofType:typeName error:error])
		return NO;
	// read the camera(s) settings from the docs prefs
	return YES;
}

- (BOOL)writeToURL:(NSURL *)absoluteURL ofType:(NSString *)typeName forSaveOperation:(NSSaveOperationType)saveOperation originalContentsURL:(NSURL *)absoluteOriginalContentsURL error:(NSError **)error {
	// save the camera(s) settings as doc prefs	
	return [super writeToURL:absoluteURL ofType:typeName forSaveOperation:saveOperation originalContentsURL:absoluteOriginalContentsURL error:error];
}
#endif

- (NSString *)windowNibName {
    return @"BlocksDoc";
}

- (void)close {
	mainView.camera.drawDelegate = nil;
	[NSManagedObjectContext setActiveContext:nil];
	[super close];
}

#pragma mark NSPersistentDocument
- (id)managedObjectModel {
	return [BAScene sceneModel];
}


#pragma mark NSNibAwaking
- (void)awakeFromNib {
	
	[self addInitialContent];
	
	float front[4]= { 0.6f,0.2f,0.2f,0.7f }, back[4]= { 0.4f,0.2f,0.2f,0.4f };
//	float shine[4] = { 0.8f,0.8f,0.8f, 0.8f};
	
	glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, front);
	glMaterialfv(GL_BACK, GL_AMBIENT_AND_DIFFUSE, back);
	glMateriali(GL_FRONT_AND_BACK, GL_SHININESS, 120);
	glEnable(GL_COLOR_MATERIAL);
	
	mainView.camera.bgColor = BAMakeColorf(0.2f, 0.4f, 0.7f, 1.0f);
    [mainView.camera translateX:0 y:4 z:16];
//	mainView.camera.culling = YES;
//	mainView.camera.depth = NO;
//	mainView.camera.testOn = YES;
//	mainView.camera.lightsOn = NO;

	[mainView setNeedsDisplay:YES];
}


#pragma mark Accessors
- (BAProp *)selectedProp {
	return [[BAActiveContext objectsForEntityNamed:@"Prop" matchingValue:@"BAPrototype:tetrahedron" forKey:@"name"] lastObject];
}


#pragma mark Private
- (void)addInitialContent {
    
    BAGroup *sample = [BlocksUtilities sampleBlocks];
    
    sample.name = @"Blocks:Sample";
    [[BAStage stage] addGroup:sample];
}

@end

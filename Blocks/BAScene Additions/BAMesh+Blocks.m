//
//  BAMesh+Blocks.m
//  Blocks
//
//  Created by Brent Gulanowski on 10-04-14.
//  Copyright 2010 Bored Astronaut Inc. All rights reserved.
//

#import "BAMesh+Blocks.h"

#import <BAFoundation/NSManagedObjectContext+BAAdditions.h>


@implementation BAMesh (Blocks)

#define b000 { 0,0,0 }
#define b001 { 0,0,1 }
#define b010 { 0,1,0 }
#define b011 { 0,1,1 }
#define b100 { 1,0,0 }
#define b101 { 1,0,1 }
#define b110 { 1,1,0 }
#define b111 { 1,1,1 }


+ (BAMesh *)block22 {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b101, b011, b110};
		NSUInteger indices[] = {0,1,2, 0,2,3, 0,3,1, 1,3,2};

		block = [BAMesh meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block31a {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block31b {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block31c {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b110};
		NSUInteger indices[] = {0,2,1, 0,3,2, 0,1,3, 1,2,3};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:4 indices:indices count:4 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block32a {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b110};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block32b {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block32c {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b110};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,4, 0,4,2, 1,2,3, 2,4,3};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block32d {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,2, 1,4,3, 1,2,4, 2,3,4};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:5 indices:indices count:6 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block33a {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b011, b110};
		NSUInteger indices[] = {0,1,4, 0,2,1, 0,3,5, 0,5,2, 0,4,3, 1,2,5, 1,5,4, 3,4,5};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block33b {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b010, b011, b111};
		NSUInteger indices[] = {0,1,4, 0,2,1, 0,3,2, 0,4,3, 1,2,5, 1,5,4, 2,3,5, 3,4,5};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block33c {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b011, b110, b111};
		NSUInteger indices[] = {0,2,1, 0,1,3, 0,3,4, 0,4,2, 1,2,5, 1,5,3, 2,4,5, 3,5,4};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block42 {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b011, b110};
		NSUInteger indices[] = {0,1,4, 0,2,3, 0,3,1, 0,4,5, 0,5,2, 1,3,4, 2,5,3, 3,5,4};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:6 indices:indices count:8 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block43 {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b010, b011, b110};
		NSUInteger indices[] = {0,1,5, 0,2,3, 0,3,1, 1,3,5, 0,4,2, 0,5,4, 2,4,6, 2,6,3, 3,6,5, 4,5,6};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:7 indices:indices count:10 polySize:3];
	}
	
	return block;
}

+ (BAMesh *)block44 {
	
	NSString *blockName = [NSString stringWithFormat:@"Blocks:Mesh:%@", NSStringFromSelector(_cmd)];
	BAMesh *block = [BAMesh findMeshWithName:blockName];
	
	if(!block) {
		
		BAPointf vertices[] = {b000, b001, b100, b101, b010, b011, b110, b111};
		NSUInteger indices[] = {0,1,5, 0,2,3, 0,3,1, 0,4,6, 0,5,4, 0,6,2, 1,3,5, 2,6,3, 3,6,7, 3,7,5, 4,5,6, 5,7,6};
		
		block = [BAMesh meshWithName:blockName vertices:vertices count:8 indices:indices count:12 polySize:3];
	}
	
	return block;
}

@end

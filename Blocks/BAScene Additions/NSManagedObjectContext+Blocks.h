//
//  NSManagedObjectContext+Blocks.h
//  Blocks
//
//  Created by Brent Gulanowski on 2013-06-13.
//
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Blocks)

- (BAPrototype *)block22; // tetrahedron
- (BAPrototype *)block31a; // triangular pyramids
- (BAPrototype *)block31b;
- (BAPrototype *)block31c;
- (BAPrototype *)block32a; // wedges
- (BAPrototype *)block32b;
- (BAPrototype *)block32c;
- (BAPrototype *)block32d;
- (BAPrototype *)block33a; // prisms
- (BAPrototype *)block33b;
- (BAPrototype *)block33c;
- (BAPrototype *)block42; // doubly-chipped cube
- (BAPrototype *)block43; // chipped cube
- (BAPrototype *)block44; // cube

- (BAPrototype *)planetWithImageNamed:(NSString *)name;
- (BAPrototype *)earth;
- (BAPrototype *)jupiter;

- (BAMesh *)block22Mesh; // tetrahedron
- (BAMesh *)block31aMesh;
- (BAMesh *)block31bMesh;
- (BAMesh *)block31cMesh;
- (BAMesh *)block32aMesh;
- (BAMesh *)block32bMesh;
- (BAMesh *)block32cMesh;
- (BAMesh *)block32dMesh;
- (BAMesh *)block33aMesh;
- (BAMesh *)block33bMesh;
- (BAMesh *)block33cMesh;
- (BAMesh *)block42Mesh;
- (BAMesh *)block43Mesh;
- (BAMesh *)block44Mesh; // cube

- (BAGroup *)sampleBlocks;
- (BAGroup *)planets;
- (BAGroup *)boxOfBoxes;

@end

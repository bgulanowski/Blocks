//
//  BlocksBrowser.m
//  Blocks
//
//  Created by Brent Gulanowski on 12-01-15.
//  Copyright (c) 2012 Marketcircle Inc. All rights reserved.
//

#import "BlocksBrowser.h"

#import "EntityInspector.h"

#import <BAScene/BAGroup.h>
#import <BAScene/BAProp.h>
#import <BAScene/BAPrototype.h>
#import <BAScene/BAPrototypeMesh.h>
#import <BAScene/BAMesh.h>
#import <BAScene/BAPolygon.h>
#import <BAScene/BAPoint.h>


@implementation BlocksBrowser

@synthesize inspectorView;
@synthesize inspectorVC;
@synthesize blocksTC;
@synthesize selections;

- (void)setInspectorVC:(EntityInspector *)vc {
 
    [inspectorVC.view removeFromSuperview];
    vc.view.frame = inspectorView.bounds;
    [inspectorView addSubview:vc.view];
    
    inspectorVC = [vc retain];
}

- (void)setSelections:(NSArray *)selections {
    
    NSManagedObject *selection = [[blocksTC selectedObjects] lastObject];
    NSString *entityName = [[selection entity] name];
    
    if(![entityName isEqualToString:[[inspectorVC.entityOC.content entity] name]]) {
        
        NSString *className = [NSString stringWithFormat:@"%@Inspector", entityName];
        Class class = NSClassFromString(className);
        
        if(!class) return;
        
        EntityInspector *vc = [[class alloc] initWithNibName:className bundle:nil];
        
        self.inspectorVC = vc;
        
        [vc release];
    }

    inspectorVC.entityOC.content = selection;
}

@end


static inline NSUInteger InverseRelationshipCount(NSManagedObject *object, NSString *targetEntityName, NSString *inverseKey) {
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    fetch.entity = [NSEntityDescription entityForName:targetEntityName inManagedObjectContext:object.managedObjectContext];
    fetch.predicate = [NSPredicate predicateWithFormat:@"%K=%@", inverseKey, object];
    
    return [object.managedObjectContext countForFetchRequest:fetch error:NULL];
}

@implementation BAGroup (BlocksBrowsing)

- (NSSet *)browserChildren {
    NSSet *props =  self.props;
    return props;
}

- (NSUInteger)countOfBrowserChildren {
    return InverseRelationshipCount(self, @"Prop", @"group");
}

- (BOOL)browserLeaf {
    return NO;
}

@end

@implementation BAProp (BlocksBrowsing)

- (NSSet *)browserChildren {
    return [self valueForKeyPath:@"prototype.prototypeMeshes"];
}

- (NSUInteger)countOfBrowserChildren {
    return InverseRelationshipCount(self.prototype, @"PrototypeMesh", @"prototype");
}

- (BOOL)browserLeaf {
    return NO;
}

@end

@implementation BAPrototype (BlocksBrowsing)

- (NSSet *)browserChildren {
    return nil;
}

- (NSUInteger)countOfBrowserChildren {
    return 0;
}

- (BOOL)browserLeaf {
    return YES;
}

@end

@implementation BAPrototypeMesh (BlocksBrowsing)

- (NSSet *)browserChildren {
    return [self valueForKeyPath:@"mesh.polygons"];
}

- (NSUInteger)countOfBrowserChildren {
    return InverseRelationshipCount(self.mesh, @"Polygon", @"mesh");
}

- (BOOL)browserLeaf {
    return NO;
}

- (NSString *)name {
    return self.mesh.name;
}

@end

@implementation BAMesh (BlocksBrowsing)

- (NSSet *)browserChildren {
    return nil;
}

- (NSUInteger)countOfBrowserChildren {
    return 0;
}

- (BOOL)browserLeaf {
    return YES;
}

@end

@implementation BAPolygon (BlocksBrowsing)

- (NSSet *)browserChildren {
    return self.points;
}

- (NSUInteger)countOfBrowserChildren {
    return InverseRelationshipCount(self, @"Point", @"polygon");
}

- (BOOL)browserLeaf {
    return NO;
}

- (NSString *)name {
    return @"polygon";
}

@end

@implementation BAPoint (BlocksBrowsing)

- (NSSet *)browserChildren {
    return nil;
}

- (NSUInteger)countOfBrowserChildren {
    return 0;
}

- (BOOL)browserLeaf {
    return YES;
}

- (NSString *)name {
    return BAStringFromPoint4f(self.vertex.point4f);
}

@end

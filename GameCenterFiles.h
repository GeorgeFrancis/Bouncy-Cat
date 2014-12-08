//
//  GameCenterFiles.h
//  Bounce Cat
//
//  Created by George Francis on 25/09/2014.
//  Copyright (c) 2014 GeorgeFrancis. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@protocol GameCenterFilesDelegate
- (void)matchStarted;
- (void)matchEnded;
- (void)match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID;
@end

@interface GameCenterFiles : NSObject<GKMatchmakerViewControllerDelegate, GKMatchDelegate> {
    NSMutableDictionary* earnedAchievementCache;
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
    
    UIViewController *presentingViewController;
    GKMatch *match;
    BOOL matchStarted;
}

@property (retain) NSMutableDictionary* earnedAchievementCache;
@property (assign, readonly) BOOL gameCenterAvailable;
@property (retain) UIViewController *presentingViewController;
@property (retain) GKMatch *match;
@property (assign) id <GameCenterFilesDelegate> delegate;

+ (GameCenterFiles *)sharedInstance;
- (void)authenticateLocalUser;
- (void)findMatchWithMinPlayers:(int)minPlayers maxPlayers:(int)maxPlayers viewController:(UIViewController *)viewController delegate:(id<GameCenterFilesDelegate>)theDelegate;
- (void)reportScore: (int64_t) score forCategory: (NSString*) category;
- (void)submitAchievement: (NSString*) identifier percentComplete: (double) percentComplete;
- (void)resetAchievements;

@end
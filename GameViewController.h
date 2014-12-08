//
//  GameViewController.h
//  Bounce Cat
//
//  Created by George Francis on 21/06/2014.
//  Copyright (c) 2014 GeorgeFrancis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"


//int CatFlight;

@interface GameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *cat;
@property (strong, nonatomic) IBOutlet UIImageView *catCollisionObject;
@property (strong, nonatomic) IBOutlet UIButton *startGame;
@property (strong, nonatomic) IBOutlet UIImageView *tunnelTop;
@property (strong, nonatomic) IBOutlet UIImageView *tunnelBottom;

@property (strong, nonatomic) IBOutlet UIImageView *tunnelTop2;
@property (strong, nonatomic) IBOutlet UIImageView *tunnelBottom2;
@property (strong, nonatomic) IBOutlet UIImageView *collisionObject1;
@property (strong, nonatomic) IBOutlet UIImageView *collisionObject2;
@property (strong, nonatomic) IBOutlet UIImageView *collisionObject3;
@property (strong, nonatomic) IBOutlet UIImageView *collisionObject4;


@property (strong, nonatomic) IBOutlet UIImageView *top;
@property (strong, nonatomic) IBOutlet UIImageView *bottom;
@property (strong, nonatomic) IBOutlet UIButton *exit;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property NSTimer *catMovement;
@property NSTimer *tunnelMovement;

@property NSTimer *catMovementOnOpen;

@property int catFlight;
@property int randomTopTunnelPosition;
@property int randomBottomTunnelPosition;

@property int randomTopTunnelPosition2;
@property int randomBottomTunnelPosition2;

@property int scoreNumber;
@property NSInteger highScoreNumber;

@property (strong, nonatomic) IBOutlet UIButton *webLink;

- (IBAction)startGame:(id)sender;
- (IBAction)goToWebSite:(id)sender;




-(void)catMoving;
-(void)tunnelMoving;
-(void)placeTunnels;
-(void)score;
-(void)gameOver;




@end

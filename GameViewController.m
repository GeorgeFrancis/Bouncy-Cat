//
//  GameViewController.m
//  Bounce Cat
//
//  Created by George Francis on 21/06/2014.
//  Copyright (c) 2014 GeorgeFrancis. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.scoreLabel setFont:[UIFont fontWithName:@"GROBOLD" size:self.scoreLabel.font.pointSize]];
    [self.exit setHidden:YES];
    self.scoreNumber = 0;
    
    
    
//    [self.tunnelBottom setHidden:YES];
//    [self.tunnelBottom2 setHidden:YES];
//    [self.tunnelTop setHidden:YES];
//    [self.tunnelTop2 setHidden:YES];

    
//    self.cat.center = CGPointMake(self.cat.center.x,self.cat.center.y - self.catFlight);
//    self.catFlight = self.catFlight - 10;
//    
//    self.catMovementOnOpen = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(catMovingOnOpen) userInfo:nil repeats:YES];
    
    
    
    
    self.highScoreNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"HighScoreSaved"];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)electricImage{

    self.cat.animationImages = [NSArray arrayWithObjects:
                                      
                                      [UIImage imageNamed:@"catElectric1.png"],
                                      [UIImage imageNamed:@"catElectric2.png"],
                                      [UIImage imageNamed:@"catElectric1.png"],
                                      [UIImage imageNamed:@"catElectric2.png"],
                                [UIImage imageNamed:@"catElectric1.png"],
                                [UIImage imageNamed:@"catElectric2.png"],
                                [UIImage imageNamed:@"catElectric1.png"],
                                [UIImage imageNamed:@"catElectric2.png"],
                                      nil];
    
    
    self.cat.animationDuration = 2.0;
    
    self.cat.animationRepeatCount = 1;
    
    [self.cat startAnimating];

}



- (IBAction)startGame:(id)sender {
    self.startGame.hidden = YES;
    self.CatMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(catMoving) userInfo:nil repeats:YES];
    
    [self placeTunnels];
   // [self placeTunnels2];
    
    self.tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:YES];
    
//    [self.tunnelBottom setHidden:NO];
//    [self.tunnelBottom2 setHidden:NO];
//    [self.tunnelTop setHidden:NO];
//    [self.tunnelTop2 setHidden:NO];
}

- (IBAction)goToWebSite:(id)sender {
    
   // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cat-surveys.com"]];
}

-(void)catMovingOnOpen{
    
    self.catFlight = 20;
    
}

-(void)catMoving {
  
    self.cat.center = CGPointMake(self.cat.center.x,self.cat.center.y - self.catFlight);
    self.catFlight = self.catFlight - 3;
    
    self.catCollisionObject.center = self.cat.center;
    
    if(self.catFlight < -15) {
        self.catFlight = -15;
    }
     //Cat flying Up image
    if (self.catFlight > 0) {
        self.cat.image = [UIImage imageNamed:@"cat1.png"];
    }
    //Cat flying Down image
    if (self.catFlight < 0) {
        self.cat.image = [UIImage imageNamed:@"cat2.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.catCollisionObject.center = self.cat.center;
    self.CatFlight = 20;
}

-(void)placeTunnels {
    
    //self.randomTopTunnelPosition = 140;
    
    self.randomTopTunnelPosition = arc4random() %300;
    self.randomTopTunnelPosition = self.randomTopTunnelPosition - 138;
    self.randomBottomTunnelPosition = self.randomTopTunnelPosition + 510;

    
    self.tunnelTop.center = CGPointMake(340, self.randomTopTunnelPosition);
    self.tunnelBottom.center =CGPointMake(340, self.randomBottomTunnelPosition);
    
}

-(void)placeTunnels2 {
    
    //self.randomTopTunnelPosition2 = 140;
    
    self.randomTopTunnelPosition2 = arc4random() %300;
    self.randomTopTunnelPosition2 = self.randomTopTunnelPosition2 - 138;
    self.randomBottomTunnelPosition2 = self.randomTopTunnelPosition2 + 510;
    
    self.tunnelTop2.center = CGPointMake(340, self.randomTopTunnelPosition2);
    self.tunnelBottom2.center =CGPointMake(340, self.randomBottomTunnelPosition2);

//    self.randomTopTunnelPosition2 = arc4random() %350;
//    self.randomTopTunnelPosition2 = self.randomTopTunnelPosition2 - 304;
//    self.randomBottomTunnelPosition2 = self.randomTopTunnelPosition2 + 600;
//    
//    self.tunnelTop2.center = CGPointMake(340, self.randomTopTunnelPosition2);
//    self.tunnelBottom2.center =CGPointMake(340, self.randomBottomTunnelPosition2);
    

}

-(void)tunnelMoving {
    
    self.tunnelTop.center = CGPointMake(self.tunnelTop.center.x -1, self.tunnelTop.center.y);
    self.tunnelBottom.center = CGPointMake(self.tunnelBottom.center.x -1, self.tunnelBottom.center.y);
    
    self.tunnelTop2.center = CGPointMake(self.tunnelTop2.center.x -1, self.tunnelTop2.center.y);
    self.tunnelBottom2.center = CGPointMake(self.tunnelBottom2.center.x -1, self.tunnelBottom2.center.y);
    self.collisionObject1.center = self.tunnelBottom2.center;
    self.collisionObject2.center = self.tunnelBottom.center;
    self.collisionObject3.center = self.tunnelTop2.center;
    self.collisionObject4.center = self.tunnelTop.center;
    
    if (self.tunnelTop.center.x <-50) {
        [self placeTunnels];
    }
    
    if (self.tunnelTop.center.x == 140) {
        [self placeTunnels2];
    }
    
    if (self.tunnelTop.center.x == 45) {
        [self score];
    }
    
    if (self.tunnelTop2.center.x == 45) {
        [self score];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.collisionObject1.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.collisionObject2.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.collisionObject3.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.collisionObject4.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.top.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.catCollisionObject.frame, self.bottom.frame)) {
        [self gameOver];
    }
}

-(void)score {
    self.scoreNumber = self.scoreNumber + 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", self.scoreNumber];
    
}

-(void)gameOver {
    
     [self electricImage];
    [self.tunnelMovement invalidate];
    [self.catMovement invalidate];
    
    [self performSelector:@selector(endGame) withObject:self afterDelay:2.0 ];

    
    
    
    
    //
//    if (self.scoreNumber > self.highScoreNumber) {
//        [[NSUserDefaults standardUserDefaults]setInteger:self.scoreNumber forKey:@"HighScoreSaved"];
//    }
//   
//    
//    [self.tunnelMovement invalidate];
//    [self.catMovement invalidate];
//    
//    [self.exit setHidden:NO];
//    [self.tunnelTop setHidden:YES];
//    [self.tunnelBottom setHidden:YES];
//    [self.cat setHidden:YES];
//    
}

-(void)endGame{
    
    if (self.scoreNumber > self.highScoreNumber) {
        [[NSUserDefaults standardUserDefaults]setInteger:self.scoreNumber forKey:@"HighScoreSaved"];
    }
    
    [self.exit setHidden:NO];
    [self.tunnelTop setHidden:YES];
    [self.tunnelBottom setHidden:YES];
    [self.cat setHidden:YES];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

}





@end

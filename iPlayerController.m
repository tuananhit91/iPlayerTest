//
//  iPlayerController.m
//  iPlayerTest
//
//  Created by BMX Studio on 8/20/15.
//  Copyright (c) 2015 BMX Studio. All rights reserved.
//

#import "iPlayerController.h"
#import "iListMusicController.h"

@interface iPlayerController ()

@end

@implementation iPlayerController
@synthesize iListMusicCont = _iListMusicCont;
@synthesize player = _player;
@synthesize volumeTimer = _volumeTimer;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}
+(instancetype)shareInstance
{
    static iPlayerController *sharedManager = nil;
    if (sharedManager == nil)
    {
        sharedManager = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
        //sharedManager.index = -1;
    }
    return sharedManager;
}

-(void)loadSounds:(NSMutableArray *)songs atIndex:(NSInteger)index{
    NSString* string =[songs objectAtIndex:index];
    self.title = string;
    NSURL *soundPath = [[NSBundle mainBundle] URLForResource:string withExtension:@"mp3"];
    self.volumeTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateVolume) userInfo:nil repeats:YES];
    [self sound:soundPath];
}


- (IBAction)doneButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)updateDuration{
    
    float currentTime = (CMTimeGetSeconds([self.playerItem currentTime]));
    self.sliderDuration.value = currentTime;
}

-(void)sound: (NSURL*)url
{
    self.playerItem = [[AVPlayerItem alloc]initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
    [self.player play];
    CMTime audioDuration = self.player.currentItem.asset.duration;
    float audioDurationSeconds = CMTimeGetSeconds(audioDuration);
    self.sliderDuration.minimumValue = 0.0;
    self.sliderDuration.maximumValue = audioDurationSeconds;
    self.timerDuration = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateDuration) userInfo:nil repeats:YES];
}

-(void)updateVolume{
    [self.player setVolume:self.slider.value];
}

-(IBAction)playButton:(id)sender{
    NSURL *soundPath = [[NSBundle mainBundle] URLForResource:self.string withExtension:@"mp3"];
    self.volumeTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateVolume) userInfo:nil repeats:YES];
    [self sound:soundPath];
}

-(IBAction)pauseButton:(id)sender{
    [self.player pause];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

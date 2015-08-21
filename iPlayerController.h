//
//  iPlayerController.h
//  iPlayerTest
//
//  Created by BMX Studio on 8/20/15.
//  Copyright (c) 2015 BMX Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class iListMusicController;

@interface iPlayerController : UIViewController

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
+(instancetype) shareInstance;
-(void) updateDuration;
@property (nonatomic,strong) iListMusicController* iListMusicCont;
@property (nonatomic,strong) AVPlayer* player;
@property (nonatomic,strong) AVPlayerItem *playerItem;
@property (nonatomic,strong) NSString* string;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISlider *sliderDuration;
@property (nonatomic, strong) NSTimer *volumeTimer;
@property (nonatomic, strong) NSTimer *timerDuration;
-(void)loadSounds:(NSMutableArray *)songs atIndex:(NSInteger)index;
@end

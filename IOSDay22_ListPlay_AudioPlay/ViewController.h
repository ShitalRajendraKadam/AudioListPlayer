//
//  ViewController.h
//  IOSDay22_ListPlay_AudioPlay
//
//  Created by Student P_02 on 09/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet UISlider *seekSlider;

@property (weak, nonatomic) IBOutlet UISlider *valumeSlider;

- (IBAction)PauseButton:(id)sender;
- (IBAction)StopButton:(id)sender;
- (IBAction)ValumeSliderAction:(id)sender;

@property AVAudioPlayer *audioPlayer;

@property NSArray *SongListArray;


@end


//
//  ViewController.m
//  IOSDay22_ListPlay_AudioPlay
//
//  Created by Student P_02 on 09/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int flag=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.SongListArray=@[@"Morya Morya",@"Teri Meri Yaariyan",@"Jai Shivaji"];

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.SongListArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.SongListArray objectAtIndex:indexPath.row];
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSURL *url=[[NSBundle mainBundle]URLForResource:[self.SongListArray objectAtIndex:indexPath.row] withExtension:@"mp3"];
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    self.audioPlayer.volume=0.5;
    self.seekSlider.minimumValue=0;
    self.seekSlider.maximumValue=self.audioPlayer.duration;
    
    

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(seekTime) userInfo:nil repeats:YES];
    self.audioPlayer.currentTime=self.seekSlider.value;
    [self.audioPlayer play];
    flag=0;


}
-(void)seekTime
{
    if(flag==0)
    {
        self.seekSlider.value=self.seekSlider.value+1;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)PauseButton:(id)sender
{
    [self.audioPlayer pause];
    flag=2;

}

- (IBAction)StopButton:(id)sender
{
    [self.audioPlayer stop];
    self.seekSlider.value=0;
    flag=1;
}

- (IBAction)ValumeSliderAction:(id)sender
{
    self.audioPlayer.volume=self.valumeSlider.value;

}
@end

//
//  AssemblySubview10.m
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "AssemblySubview10.h"
#import "SJVideoPlayer.h"
@interface AssemblySubview10()
@property (nonatomic, strong) SJVideoPlayer *player;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIButton *playButton;
@end
@implementation AssemblySubview10

-(void)createSubView
{
    
    [self addSubview:self.coverImageView];
    [self.coverImageView addSubview:self.playButton];
    
    [_coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.offset(0);
        make.bottom.offset(-8);
    }];
    
    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(300);
    }];
    
    [_player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(250);
        make.bottom.equalTo(self);
    }];
   
    
}
- (UIImageView *)coverImageView {
    if ( _coverImageView ) return _coverImageView;
    _coverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cover"]];
    _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    _coverImageView.clipsToBounds = YES;
    _coverImageView.userInteractionEnabled = YES;
    _coverImageView.tag = 101;
    return _coverImageView;
}

- (UIButton *)playButton {
    if ( _playButton ) return _playButton;
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playButton setImage:[UIImage imageNamed:@"db_play_big"] forState:UIControlStateNormal];
    [_playButton addTarget:self action:@selector(userClickedPlayButton) forControlEvents:UIControlEventTouchUpInside];
    return _playButton;
}

- (void)userClickedPlayButton {
    
    [self.player stopAndFadeOut];
    self.player = [SJVideoPlayer player];
    [self.coverImageView addSubview:self.player.view];
    [self.player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    self.player.URLAsset = [[SJVideoPlayerURLAsset alloc] initWithURL:[NSURL URLWithString:self.dataModel.imgurl]];
    _player.URLAsset.title =self.dataModel.title;
    _player.showResidentBackButton =NO;
    _player.hideBackButtonWhenOrientationIsPortrait = YES;
    
}
@end

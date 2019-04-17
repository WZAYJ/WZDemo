//
//  VoiceAnnouncementViewController.m
//  Demo
//
//  Created by apple on 2019/4/17.
//  Copyright © 2019 SRT. All rights reserved.
//

#define LoadingText @"请说话。。。"

#import "VoiceAnnouncementViewController.h"
#import <AVFoundation/AVFoundation.h>

//   AVSpeechSynthesizer: 语音合成器, 可以假想成一个可以说话的人, 是最主要的接口
//   AVSpeechSynthesisVoice: 可以假想成人的声音
//   AVSpeechUtterance: 可以假想成要说的一段话

//  AVSpeechSynthesizer
/*
 代理
 开始播放 语音单元
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance;
 完成播放 语音单元
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance;
 暂停播放 语音单元
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance;
 继续播放 语音单元
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance;
  取消播放 语音单元
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance;
 这里 指的是 又来监听 播放 字符范围
 - (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance;
 
 方法 ：
 添加 播放话语 到 播放语音 队列, 可以设置utterance的属性来控制播放
 - (void)speakUtterance:(AVSpeechUtterance *)utterance;
 
 对于 stopSpeakingAtBoundary: 语音单元的操作, 如果中断, 会清空队列
 中断
 - (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 暂停
 - (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary;
 继续
 - (BOOL)continueSpeaking;
 */

//AVSpeechUtterance
/*
 属性：
 设置使用哪一个国家的语言播放
 @property(nonatomic, retain, nullable) AVSpeechSynthesisVoice *voice;
 本段文字播放时的 语速, 应介于AVSpeechUtteranceMinimumSpeechRate 和 AVSpeechUtteranceMaximumSpeechRate 之间
 @property(nonatomic) float rate;
 在播放特定语句时改变声音的声调, 一般取值介于0.5(底音调)~2.0(高音调)之间
 @property(nonatomic) float pitchMultiplier;
 声音大小, 0.0 ~ 1.0 之间
 @property(nonatomic) float volume;
 播放后的延迟, 就是本次文字播放完之后的停顿时间, 默认是0
 @property(nonatomic) NSTimeInterval preUtteranceDelay;
 播放前的延迟, 就是本次文字播放前停顿的时间, 然后播放本段文字, 默认是0
 @property(nonatomic) NSTimeInterval postUtteranceDelay;
 */
//   AVSpeechSynthesisVoice
/*
 ar-SA  沙特阿拉伯（阿拉伯文）
 
 en-ZA, 南非（英文）
 
 nl-BE, 比利时（荷兰文）
 
 en-AU, 澳大利亚（英文）
 
 th-TH, 泰国（泰文）
 
 de-DE, 德国（德文）
 
 en-US, 美国（英文）
 
 pt-BR, 巴西（葡萄牙文）
 
 pl-PL, 波兰（波兰文）
 
 en-IE, 爱尔兰（英文）
 
 el-GR, 希腊（希腊文）
 
 id-ID, 印度尼西亚（印度尼西亚文）
 
 sv-SE, 瑞典（瑞典文）
 
 tr-TR, 土耳其（土耳其文）
 
 pt-PT, 葡萄牙（葡萄牙文）
 
 ja-JP, 日本（日文）
 
 ko-KR, 南朝鲜（朝鲜文）
 
 hu-HU, 匈牙利（匈牙利文）
 
 cs-CZ, 捷克共和国（捷克文）
 
 da-DK, 丹麦（丹麦文）
 
 es-MX, 墨西哥（西班牙文）
 
 fr-CA, 加拿大（法文）
 
 nl-NL, 荷兰（荷兰文）
 
 fi-FI, 芬兰（芬兰文）
 
 es-ES, 西班牙（西班牙文）
 
 it-IT, 意大利（意大利文）
 
 he-IL, 以色列（希伯莱文，阿拉伯文）
 
 no-NO, 挪威（挪威文）
 
 ro-RO, 罗马尼亚（罗马尼亚文）
 
 zh-HK, 香港（中文）
 
 zh-TW, 台湾（中文）
 
 sk-SK, 斯洛伐克（斯洛伐克文）
 
 zh-CN, 中国（中文）
 
 ru-RU, 俄罗斯（俄文）
 
 en-GB, 英国（英文）
 
 fr-FR, 法国（法文）
 
 hi-IN  印度（印度文）
 */
@interface VoiceAnnouncementViewController ()<AVSpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (nonatomic, strong) AVSpeechUtterance *utterance;
@property (nonatomic, strong) AVSpeechSynthesizer *synth;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;

@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UISlider *slider3;




@end

@implementation VoiceAnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"语音";
    _synth = [[AVSpeechSynthesizer alloc]init];
    _synth.delegate = self;

}

- (IBAction)playVoice:(id)sender {
    
    NSString*string = @"";
    if (_textview.text.length<1) {
        string = @"请在上方输入播报内容";
    }
    else
    {
        string = _textview.text;
    }
    _utterance = [AVSpeechUtterance speechUtteranceWithString:string];
    _utterance.rate =_slider1.value;
    _utterance.pitchMultiplier = _slider2.value;
    _utterance.volume = _slider3.value;
    _utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"];
    if (!_synth.speaking) {
    [_synth speakUtterance:_utterance];
     }
    
}
- (IBAction)stopav:(id)sender {
    
    [_synth stopSpeakingAtBoundary:0];

}

- (IBAction)pauseAct:(id)sender {
    
    if (_synth) {
        if (!_synth.paused) {
            [_synth pauseSpeakingAtBoundary:0];
        }
        else{
            [_synth continueSpeaking];
        }
        ((UIButton*)sender).selected = !((UIButton*)sender).selected;
    }
   
}




@end

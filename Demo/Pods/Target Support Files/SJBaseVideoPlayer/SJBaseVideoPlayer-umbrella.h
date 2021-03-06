#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SJBaseVideoPlayer+PlayStatus.h"
#import "SJBaseVideoPlayer.h"
#import "SJVideoPlayerURLAssetPrefetcher.h"
#import "UIScrollView+ListViewAutoplaySJAdd.h"
#import "SJBaseVideoPlayerDefines.h"
#import "SJBaseVideoPlayerStatisticsDefines.h"
#import "SJControlLayerAppearManagerDefines.h"
#import "SJDeviceVolumeAndBrightnessManagerDefines.h"
#import "SJFitOnScreenManagerDefines.h"
#import "SJFlipTransitionManagerDefines.h"
#import "SJMediaPlaybackProtocol.h"
#import "SJModalViewControlllerManagerDefines.h"
#import "SJPlayerBufferStatus.h"
#import "SJPlayerGestureControlDefines.h"
#import "SJReachabilityDefines.h"
#import "SJRotationManagerDefines.h"
#import "SJVideoPlayerControlLayerProtocol.h"
#import "SJVideoPlayerPlayStatusDefines.h"
#import "SJVideoPlayerPreviewInfo.h"
#import "SJPlayerAutoplayConfig.h"
#import "SJPlayModel.h"
#import "SJVideoPlayerURLAsset.h"
#import "SJAVMediaMainPresenter.h"
#import "SJAVMediaPlayAssetLoader.h"
#import "SJAVMediaPlaybackController.h"
#import "SJVideoPlayerURLAsset+SJAVMediaPlaybackAdd.h"
#import "SJAVMediaModelProtocol.h"
#import "SJAVMediaPlayAsset+SJAVMediaPlaybackControllerAdd.h"
#import "SJAVMediaPlayAsset.h"
#import "SJAVMediaPlayAssetProtocol.h"
#import "SJDeviceVolumeAndBrightnessManager.h"
#import "SJBorderLineView.h"
#import "SJDeviceBrightnessView.h"
#import "SJDeviceVolumeAndBrightnessManagerResourceLoader.h"
#import "SJPrompt.h"
#import "SJPromptConfig.h"
#import "SJRotationManager.h"
#import "SJVCRotationManager.h"
#import "NSTimer+SJAssetAdd.h"
#import "SJBaseVideoPlayerAutoRefreshController.h"
#import "SJBaseVideoPlayerStatistics.h"
#import "SJControlLayerAppearStateManager.h"
#import "SJFitOnScreenManager.h"
#import "SJFlipTransitionManager.h"
#import "SJIsAppeared.h"
#import "SJModalViewControlllerManager.h"
#import "SJPlayerGestureControl.h"
#import "SJPlayerView.h"
#import "SJPlayModelPropertiesObserver.h"
#import "SJReachability.h"
#import "SJTimerControl.h"
#import "SJVideoPlayerPresentView.h"
#import "SJVideoPlayerRegistrar.h"
#import "UIView+SJVideoPlayerAdd.h"

FOUNDATION_EXPORT double SJBaseVideoPlayerVersionNumber;
FOUNDATION_EXPORT const unsigned char SJBaseVideoPlayerVersionString[];


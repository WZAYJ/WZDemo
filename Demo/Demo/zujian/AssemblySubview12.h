//
//  AssemblySubview12.h
//  Demo
//
//  Created by apple on 2019/4/4.
//  Copyright © 2019 SRT. All rights reserved.
//

#import "BaseAssemblyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssemblySubview12 : BaseAssemblyView

@end

@interface AssemblySubview12Cell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *headimageV;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *messageL;
@end
NS_ASSUME_NONNULL_END

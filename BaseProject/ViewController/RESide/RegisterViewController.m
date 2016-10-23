//
//  RegisterViewController.m
//  BaseProject
//
//  Created by liuping on 2016/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTopView.h"
#import "RegisterBottomView.h"

@interface RegisterViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
/**
 *  上部分视图
 */
@property (nonatomic,strong) RegisterTopView *topView;
/**
 *  下部分视图
 */
@property (nonatomic,strong) RegisterBottomView *bottomView;
/**
 *  头像文件名
 */
@property (nonatomic,strong) NSString *imageFile;
@end

@implementation RegisterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];
    [self setupAutoLayout];
    
    /** 给头像添加手势，选择照片*/
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choosePhoto)];
    [self.topView.iconIV addGestureRecognizer:tap];
    self.topView.iconIV.userInteractionEnabled = YES;
    /** 给按钮添加关联方法 */
    [self.topView.backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView.FinishBtn addTarget:self action:@selector(finishRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView.messageBtn addTarget:self action:@selector(showMessage) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark -
#pragma mark - 自动适配
- (void)setupAutoLayout
{
    __weak typeof(self)vc = self;
    //设置上部分视图约束
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.view.mas_top);
        make.centerX.equalTo(vc.view.mas_centerX);
        make.left.equalTo(vc.view.mas_left);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height * 0.4);
    }];
    
    //设置下部分视图的约束
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.topView.mas_bottom);
        make.left.and.right.bottom.equalTo(vc.view);
    }];
    
}

#pragma mark -
#pragma mark - 懒加载
- (RegisterTopView *)topView
{
    if (!_topView) {
        _topView = [[RegisterTopView alloc] init];
    }
    return _topView;
}


- (RegisterBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[RegisterBottomView alloc] init];
    }
    return _bottomView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark -
#pragma mark - 按钮关联方法
- (void)goBack{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)finishRegister{
    
}

- (void)showMessage{
    NSLog(@"协议页面");
}
#pragma mark -
#pragma mark - 手势关联方法
- (void)choosePhoto{
    //显示提示框
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionPhoto = [UIAlertAction actionWithTitle:@"相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //开启相机拍照
        [self takePhoto:0];
    }];
    
    UIAlertAction *actionLibrary = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //从相册中选择照片
        [self takePhoto:1];
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertVC addAction:actionPhoto];
    [alertVC addAction:actionLibrary];
    [alertVC addAction:actionCancel];
    [self presentViewController:alertVC animated:YES completion:nil];
}
#pragma mark -
#pragma mark - 其他方法
- (void)takePhoto:(NSInteger)index{
    switch (index) {
        case 0:{//唤醒相机
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                //创建照片拾取器
                UIImagePickerController *picker = [[UIImagePickerController alloc]init];
                //设置代理
                picker.delegate = self;
                //设置来源
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                //允许编辑照片
                picker.allowsEditing = YES;
                [self presentViewController:picker animated:YES completion:nil];
            }else{
                [SVProgressHUD showErrorWithStatus:@"您的设备不支持相机功能"];
            }
        }
            break;
        case 1:{//唤醒相册
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
                //创建图片拾取器
                UIImagePickerController *picker = [[UIImagePickerController alloc]init];
                //设置代理
                picker.delegate = self;
                //设置来源
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                //允许编辑照片
                picker.allowsEditing = YES;
                [self presentViewController:picker animated:YES completion:nil];
            }else{
                [SVProgressHUD showErrorWithStatus:@"您的设备不支持相册功能"];
            }
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark - 图片拾取器代理方
/** 完成获取图片的操作 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取编辑过的照片,设置头像
    UIImage *iconImage = info[UIImagePickerControllerEditedImage];
    //将图片写入沙盒
    NSString *homePhoto = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    
    NSString *imageViews = [homePhoto stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    [UIImageJPEGRepresentation(iconImage, 1.0f) writeToFile:imageViews atomically:YES];
    self.imageFile = imageViews;
    
    self.topView.iconIV.image = iconImage;
    self.topView.iconIV.layer.cornerRadius = 28;
    self.topView.iconIV.layer.masksToBounds = YES;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end

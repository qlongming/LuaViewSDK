//
//  ViewController.m
//  lv5.1.4
//
//  Created by dongxicheng on 11/5/14.
//  Copyright (c) 2014 dongxicheng. All rights reserved.
//

#import "ViewController.h"
#import "LuaViewSDK.h"
#import "LVRSA.h"
#import "LVPkgManager.h"
#import "LVLuaObjBox.h"
#import "LVErrorView.h"
#import "JHSLuaErrorView.h"
#import "JHSLuaLoadingView.h"
#import "JHSLuaCollectionView.h"
#import "JHSLuaTableView.h"
#import "JHSLuaViewButton.h"
#import "JHSLuaViewImageView.h"
#import "JHSLuaViewController.h"


@interface ViewController ()
@property(nonatomic,strong) UITableView* tableView;
@property(nonatomic,strong) NSArray* names;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"LuaView 测试demo";
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.names = @[@"gifDemo.lua", @"attributedFontDemo.lua",//
                   @"tableViewDemo.lua", @"collectionViewDemo.lua",//
                   @"animationSnow.lua",@"animationLiZi.lua", @"animationFire.lua",@"animationFire2.lua",//
                   @"testunit.lua",//
                   @"shake.lua",@"downloader.lua",@"downloader2.lua",@"flxNodeDemo.lua",//
                   @"System.lua"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"default.identifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if( cell==nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* name =  self.names[indexPath.row];
    NSLog(@"%@",name);
    JHSLuaViewController* c = [[JHSLuaViewController alloc] initWithSource:name];
    [self.navigationController pushViewController:c animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

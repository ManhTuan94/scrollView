//
//  ViewController.m
//  FootBallers
//
//  Created by Tuan EM on 4/10/13.
//  Copyright (c) 2013 Tuan EM. All rights reserved.
//

#import "ViewController.h"
#define ROW_HEIGHT 150
#define ROW_NUM 10

@interface ViewController ()
{
    NSDictionary* _dic;
    NSArray* _names;
    NSArray* _photos;
    NSArray* _age;
    NSArray* _team;
}
@end

@implementation ViewController
-(void) loadView{
    [super loadView];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"footballers" ofType:@"plist"];
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _names = [_dic objectForKey:@"Name"];
    _photos = [_dic objectForKey:@"Photo"];
    _age = [_dic objectForKey:@"Age"];
    _team = [_dic objectForKey:@"Team"];

    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, ROW_HEIGHT*ROW_NUM);
    for (int i=0; i<ROW_NUM; i++) {
        UIImageView* _avata = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10+ROW_HEIGHT*i, 140, 140)];
        _avata.image = [UIImage imageNamed:[_photos objectAtIndex:i]];
        _avata.contentMode = UIViewContentModeScaleAspectFill;
        UILabel* _lable = [[UILabel alloc] initWithFrame:CGRectMake(160, 10+ROW_HEIGHT*i, 200, 140)];
        _lable.backgroundColor = [UIColor clearColor];
        _lable.numberOfLines = 6;
        NSString* name = [_names objectAtIndex:i];
        NSString* age = [_age objectAtIndex:i];
        NSString* team = [_team objectAtIndex:i];
        _lable.textColor = [UIColor yellowColor];
        _lable.font = [UIFont systemFontOfSize:18];
        _lable.text = [NSString stringWithFormat: @"  Name : %@ \n\n  Age : %@\n\n  Team : %@",name,age,team];
        [_scrollView addSubview:_lable];
        [_scrollView addSubview:_avata];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"football.jpg"]]];
	self.navigationItem.title = @"FootBallers List";
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

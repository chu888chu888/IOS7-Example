//
//  RentTableViewController.h
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "SecondCustomerTableViewController.h"
#import "SecondHouseInfoViewController.h"
#import "RentCell.h"




@interface SecondCustomerTableViewController ()

@property (strong, nonatomic) NSMutableArray *rentData;
@property (strong, nonatomic) NSString *listTableViewCellIdentifier;

@end

@implementation SecondCustomerTableViewController
#pragma mark - 初始化
/**
 *  数据的懒加载
 */
static int count;

-(id)init{
    self = [super init];
    if(nil!=self){
        count=0;
        self.listTableViewCellIdentifier = @"secondCell";
    }
    return self;
}

- (NSMutableArray *)rentData
{
    if (!_rentData) {
        self.rentData = [NSMutableArray array];
    }
    return _rentData;
}

-(void)getData:(int)number to:(NSString*)who
{
    int start = count;
    int length = number;
    
    
    NSDictionary *limit = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", start],@"start",[NSString stringWithFormat:@"%d", length],@"length",nil];
    
    NSDictionary *condition = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",limit,@"limit",@"0",@"moneyRange",nil];
    
    
    
    DSJSONRPCCompletionHandler rentCompletionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        //        blockSelf->_rentBadgeView.text= [methodResult objectForKey:@"result"];
        
        if ([[methodResult objectForKey:@"result"] isKindOfClass:[NSArray class]]) {
            [self.rentData addObjectsFromArray:[methodResult objectForKey:@"result"]];
            count = count+length;
            [self.view reloadData];
        }
        
        if ([who  isEqual: @"header"]) {
            [self.view headerEndRefreshing];
        }
        
        if ([who  isEqual: @"footer"]) {
            [self.view footerEndRefreshing];
        }
        
        
        
    };
    
    [self RPCUseClass:@"Follow" callMethodName:@"getSecondFollowPage" withParameters:condition onCompletion:rentCompletionHandler];
}

-(void)loadView{
    self.view = [[UITableView alloc] init];
    self.view.dataSource = self;
    self.view.delegate = self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setTitle:@"二手房"];
    
    [self addBackButton];
    //    [self.navigationController.navigationBar setAlpha:1.0];
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    
    // 1.注册cell
    
    UINib *nib = [UINib nibWithNibName:@"RentCell" bundle:nil];
    [self.view registerNib:nib forCellReuseIdentifier:self.listTableViewCellIdentifier];
    self.view.rowHeight=66;
    
    // 2.集成刷新控件
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.view addHeaderWithTarget:self action:@selector(headerRereshing)];
    //#warning 自动刷新(一进入程序就下拉刷新)
    [self.view headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.view addFooterWithTarget:self action:@selector(footerRereshing)];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.view deselectRowAtIndexPath:[self.view indexPathForSelectedRow] animated:YES];
}

/**
 为了保证内部不泄露，在dealloc中释放占用的内存
 */
- (void)dealloc
{
    //    NSLog(@"MJTableViewController--dealloc---");
}




#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    [self getData:10 to:@"header"];
    
    
}

- (void)footerRereshing
{
    [self getData:10 to:@"footer"];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RentCell *cell = (RentCell *)[tableView dequeueReusableCellWithIdentifier:self.listTableViewCellIdentifier];
    
    
    cell.nameValue.text = [[_rentData[indexPath.row] objectForKey:@"secondHouses"] objectForKey:@"name"];
    cell.nameValue.font =[UIFont fontWithName:@"Helvetica" size:13];
    
    cell.phoneValue.text = [[_rentData[indexPath.row] objectForKey:@"secondHouses"] objectForKey:@"phone"];
    cell.phoneValue.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.nameLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.phoneLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.useLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    //异步加载图片
    NSString *houseType= [[[_rentData[indexPath.row] objectForKey:@"secondHouses" ] objectForKey:@"house_type"] substringToIndex:1];
    if (![[[_rentData[indexPath.row] objectForKey:@"secondHouses"] objectForKey:@"pic_url"] isEqualToString:@""]) {
        [cell.imageValue setImageWithURL:[NSURL URLWithString:[[_rentData[indexPath.row] objectForKey:@"rentResources"] objectForKey:@"pic_url"]] placeholderImage:[UIImage imageNamed:@"default_bg_ square"]];
    }else{
        if ([houseType isEqualToString:@"1"]) {
            [cell.imageValue setImage:[UIImage imageNamed:@"one_room"]];
        }else if([houseType isEqualToString:@"2"]){
            [cell.imageValue setImage:[UIImage imageNamed:@"two_room"]];
        }else if([houseType isEqualToString:@"3"]){
            [cell.imageValue setImage:[UIImage imageNamed:@"three_room"]];
        }else{
            [cell.imageValue setImage:[UIImage imageNamed:@"default_bg_ square"]];
        }
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSLog(@"%ld", (long)indexPath.row);
        
        
        NSDictionary *condition = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",[_rentData[indexPath.row] objectForKey:@"id"],@"id",nil];
        
        DSJSONRPCCompletionHandler completionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
            [self.rentData removeObjectAtIndex:[indexPath row]];
            if ([[methodResult objectForKey:@"code"] isEqualToString:@"070800"]) {
               
                self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"取消收藏成功!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                
                [NSTimer scheduledTimerWithTimeInterval:0.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
                
                [self.view deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
            }else{
                self.promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"取消收藏失败!" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                
                [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(removeInfo) userInfo:self.promptAlert repeats:NO];
                
            }
            [self.promptAlert show];
            
        };
        
        [self RPCUseClass:@"Follow" callMethodName:@"deleteFollow" withParameters:condition onCompletion:completionHandler];
        
        
        
    }
    
}



////可能我们会对按钮的出现和消失的时刻感兴趣，那么此刻要实现代理的方法
//- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
//
//- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondHouseInfoViewController *rentInfoVC = [[SecondHouseInfoViewController alloc] initWithId:[_rentData[indexPath.row] objectForKey:@"wanted_id"]];
    
    
    [self.navigationController pushViewController:rentInfoVC animated:YES];
}
@end

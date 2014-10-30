//
//  RentTableViewController.h
//  weChat
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "SecondHousesTableViewController.h"
#import "SecondHouseInfoViewController.h"
#import "RentCell.h"




@interface SecondHousesTableViewController ()

@property (strong, nonatomic) NSMutableArray *rentData;
@property (strong, nonatomic) NSString *listTableViewCellIdentifier;

@end

@implementation SecondHousesTableViewController
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
    
    NSDictionary *condition = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",self.home,@"home",limit,@"limit",@"0",@"moneyRange",self.beforeDay,@"beforeDay",self.distance,@"distance",nil];
    
    
    
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
    
    [self RPCUseClass:@"SecondHouses" callMethodName:@"getRequestPageSources" withParameters:condition onCompletion:rentCompletionHandler];
}

-(void)loadView{
    self.view = [[UITableView alloc] init];
    self.view.dataSource = self;
    self.view.delegate = self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setTitle:@"出租房"];
    
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
    count=0;
    //    self.rentData =[[NSMutableArray alloc] init];
    [self.rentData removeAllObjects];
    //这句话非常重要
    [self.view reloadData];
    
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
    
    
    cell.nameValue.text = [_rentData[indexPath.row] objectForKey:@"name"];
    cell.nameValue.font =[UIFont fontWithName:@"Helvetica" size:13];
    
    cell.phoneValue.text = [_rentData[indexPath.row] objectForKey:@"phone"];
    cell.phoneValue.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.nameLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.phoneLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    cell.useLable.font =[UIFont fontWithName:@"Helvetica" size:13];
    //异步加载图片
    NSString *houseType= [[_rentData[indexPath.row] objectForKey:@"house_type"] substringToIndex:1];
    
    
    if (![[_rentData[indexPath.row] objectForKey:@"pic_url"] isEqualToString:@""]) {
        [cell.imageValue setImageWithURL:[NSURL URLWithString:[_rentData[indexPath.row] objectForKey:@"pic_url"]] placeholderImage:[UIImage imageNamed:@"default_bg_ square"]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondHouseInfoViewController *rentInfoVC = [[SecondHouseInfoViewController alloc] initWithId:[_rentData[indexPath.row] objectForKey:@"id"]];
    
    
    [self.navigationController pushViewController:rentInfoVC animated:YES];
}
@end

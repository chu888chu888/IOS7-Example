//
//  CallRecordViewController.m
//  weChat
//
//  Created by apple on 14-9-29.
//  Copyright (c) 2014年 marenqing. All rights reserved.
//

#import "CallRecordViewController.h"
NSString *const CallRecordCellIdentifier = @"CallRecordCell";

@interface CallRecordViewController ()
@property (strong, nonatomic) NSMutableArray *rentData;
@property (strong, nonatomic) NSString *typeId;
@property (nonatomic) bool isReload;
@end

@implementation CallRecordViewController

static int count;

-(id)init{
    self = [super init];
    if(nil!=self){
        count=0;
        _typeId = @"1";
    }
    return self;
}


- (void)reloadwithTypeId:(NSString*) typeId;
{
    count=0;
//    self.rentData =[[NSMutableArray alloc] init];
    [self.rentData removeAllObjects];
    //这句话非常重要
     [self.view.listView reloadData];
    _typeId= typeId;
    
    
   [self.view.listView headerBeginRefreshing];
   
}

-(void)getData:(int)number to:(NSString*)who
{
    int start = count;
    int length = number;


    NSDictionary *limit = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", start],@"start",[NSString stringWithFormat:@"%d", length],@"length",nil];
    
    NSDictionary *condition = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"diploma"],@"diploma",limit,@"limit",_typeId,@"typeId",nil];

    
    DSJSONRPCCompletionHandler rentCompletionHandler = ^(NSString *methodName, NSInteger callId, id methodResult, DSJSONRPCError *methodError, NSError *internalError) {
        
        //        blockSelf->_rentBadgeView.text= [methodResult objectForKey:@"result"];
        
        if ([[methodResult objectForKey:@"result"] isKindOfClass:[NSArray class]]) {
            [self.rentData addObjectsFromArray:[methodResult objectForKey:@"result"]];
            
            
            count = count+(int)[[methodResult objectForKey:@"result"] count];
            //            count = count+(int)[[methodResult objectForKey:@"result"] count];
            
        }
                [self.view.listView reloadData];
             if ([who  isEqual: @"header"]) {
                 [self.view.listView headerEndRefreshing];
             }
             
             if ([who  isEqual: @"footer"]) {
                 [self.view.listView footerEndRefreshing];
             }

      
        
        
    };

    [self RPCUseClass:@"Call" callMethodName:@"getCallRecordsPage" withParameters:condition onCompletion:rentCompletionHandler];
}
-(void) loadView{
    
    self.view = [[CallRecord alloc] init];

    self.view.listView.dataSource = self;
    self.view.listView.delegate = self;
    [self.view.segmentedControl addTarget:self action:@selector(segmentHandle:) forControlEvents:UIControlEventValueChanged];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"拨打记录";
    
    [self addBackButton];
     self.rentData = [NSMutableArray array];
  
    // 2.集成刷新控件
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.view.listView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //#warning 自动刷新(一进入程序就下拉刷新)
    [self.view.listView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.view.listView addFooterWithTarget:self action:@selector(footerRereshing)];
    // Do any additional setup after loading the view.
}


-(void) viewWillAppear:(BOOL)animated
{
    [self.view.listView deselectRowAtIndexPath:[self.view.listView indexPathForSelectedRow] animated:YES];
}


-(void)segmentHandle:(id)sender{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [self reloadwithTypeId:@"1"];
            break;
        case 1:
            [self reloadwithTypeId:@"2"];
            break;
        case 2:
            [self reloadwithTypeId:@"3"];
            break;
            
        default:
            break;
    }
}


#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
//    _isReload= true;
  
    [self getData:10 to:@"header"];
   
}

- (void)footerRereshing
{
//     _isReload= false;
    [self getData:10 to:@"footer"];
   
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CallRecordCellIdentifier];
//    这里有性能问题
//    if ((cell == nil)||(_isReload)) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CallRecordCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *timeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        timeLable.text= [_rentData[indexPath.row] objectForKey:@"create_at"];
        timeLable.font =[UIFont baseWithSize:10];
        timeLable.textColor =[UIColor grayColor];
        cell.accessoryView= timeLable;
    
    if ([_typeId isEqual:@"1"]) {
        if ([[_rentData[indexPath.row] objectForKey:@"wanted"] isKindOfClass:[NSDictionary class]]) {
            cell.textLabel.text= [[_rentData[indexPath.row] objectForKey:@"wanted"] objectForKey:@"name"];
            cell.detailTextLabel.text=[[_rentData[indexPath.row] objectForKey:@"wanted"] objectForKey:@"phone"];
        }
        
    }
    
    if ([_typeId isEqual:@"2"]) {
        if ([[_rentData[indexPath.row] objectForKey:@"rentResources"] isKindOfClass:[NSDictionary class]]) {
            cell.textLabel.text= [[_rentData[indexPath.row] objectForKey:@"rentResources"] objectForKey:@"name"];
            cell.detailTextLabel.text=[[_rentData[indexPath.row] objectForKey:@"rentResources"] objectForKey:@"phone"];
        }
    }
    
    if ([_typeId isEqual:@"3"]) {
        if ([[_rentData[indexPath.row] objectForKey:@"secondHouses"] isKindOfClass:[NSDictionary class]]) {
            cell.textLabel.text= [[_rentData[indexPath.row] objectForKey:@"secondHouses"] objectForKey:@"name"];
            cell.detailTextLabel.text=[[_rentData[indexPath.row] objectForKey:@"secondHouses"] objectForKey:@"phone"];
        }
    }

        
       
//    }
    return cell;
    
    
//    cell.nameValue.text = [_rentData[indexPath.row] objectForKey:@"name"];
//    cell.nameValue.font =[UIFont fontWithName:@"Helvetica" size:13];
//    
//    cell.phoneValue.text = [_rentData[indexPath.row] objectForKey:@"phone"];
//    cell.phoneValue.font =[UIFont fontWithName:@"Helvetica" size:13];
//    cell.nameLable.font =[UIFont fontWithName:@"Helvetica" size:13];
//    cell.phoneLable.font =[UIFont fontWithName:@"Helvetica" size:13];
//    cell.useLable.font =[UIFont fontWithName:@"Helvetica" size:13];
//    //异步加载图片
//    
//    if ([[_rentData[indexPath.row] objectForKey:@"pic_url"] isKindOfClass:[NSString class]]) {
//        [cell.imageValue setImageWithURL:[NSURL URLWithString:[_rentData[indexPath.row] objectForKey:@"pic_url"]] placeholderImage:[UIImage imageNamed:@"default_bg_ square"]];
//    }else{
//        [cell.imageValue setImage:[UIImage imageNamed:@"default_bg_ square"]];
//    }
//    
    
    
//    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    RentInfoViewController *rentInfoVC = [[RentInfoViewController alloc] initWithId:[_rentData[indexPath.row] objectForKey:@"id"]];
//    
//    
//    [self.navigationController pushViewController:rentInfoVC animated:YES];
}


@end

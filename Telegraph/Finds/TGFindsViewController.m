//
//  TGFindsViewController.m
//  Telegraph
//
//  Created by tayler andy on 2019/1/2.
//

#import "TGFindsViewController.h"
//#import <thirdparty/AFNetworking/AFNetworking.h>
#import "DBAFNetworking.h"

@interface TGFindsViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSDictionary *finds;

@end

@implementation TGFindsViewController


#pragma mark -network

- (AFHTTPSessionManager *)manager  {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    return manager;
}

- (void)loadView
{
    [super loadView];
    
    self.titleText = TGLocalized(@"Finds.Title");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *findsURL = @"http://yutuds001.com/json/temp/init.json";
    [self.manager GET:findsURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        TGLog(@"findsURL success is %@", response);
        self.finds = response;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TGLog(@"findsURL error is %@", error.localizedDescription);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

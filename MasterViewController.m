//
//  MasterViewController.m
//  NeteaseCrack
//
//  Created by binluo on 15/5/30.
//  Copyright (c) 2015年 binluo. All rights reserved.
//

#import "MasterViewController.h"
#import "MGTemplateEngine.h"
#import "ICUTemplateMatcher.h"

@interface MasterViewController ()<MGTemplateEngineDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.webView];
    
    [self configureView];
}

- (void)configureView {
    // Set up template engine with your chosen matcher.
    MGTemplateEngine *engine = [MGTemplateEngine templateEngine];
    [engine setDelegate:self];
    [engine setMatcher:[ICUTemplateMatcher matcherWithTemplateEngine:engine]];
    
    // Set up any needed global variables.
    // Global variables persist for the life of the engine, even when processing multiple templates.
    [engine setObject:@"Hi there!" forKey:@"hello"];
    
    // Get path to template.
    NSString *templatePath = [[NSBundle mainBundle] pathForResource:@"content_template" ofType:@"html"];
    
    NSString *content = @"　　<!--VIDEO#0--><br/></p><!--IMG#0--><p>　　本报讯 5月28日凌晨1点20分左右，一架首都机场起飞的俄罗斯全禄航空班机飞进北京三环以内，闯入保护区。昨天，俄罗斯全禄航空公司回应称，初步调查，飞机偏离航线主要因为录入机载数据错误。飞机没有飞到禁飞区，也没有对乘客和居民造成威胁。</p><p>　　<b>事件：俄罗斯航班飞进东三环</b></p><p>　　5月28日凌晨1点20分左右，从北京首都机场飞往莫斯科的UN8888次航班在起飞后飞进北京市区，进入三环以内。由于飞机飞行高度较低，东便门、国贸一带许多居民都听到飞机响声。多位居民表示听见巨大引擎声，不明就里。</p><p>　　据了解，该UN8888次航班隶属于俄罗斯全禄航空公司，该航班28日凌晨1点17分自首都机场起飞，前往莫斯科。按照飞机的正确飞行路线，飞机从首都机场起飞后应该先向南飞，之后向东，再向北飞行。但该航班起飞后，在向南飞行一段路程之后，开始向西飞行，直奔北京市区。</p><p>　　所幸，由于发现及时，航班偏离航线没有对机上乘客和北京居民造成太大影响。</p><p>　　<b>调查：初判为录入机载数据错误</b></p><p>　　据知情人士介绍，飞机错入市区的原因是机长弄错了飞行方向，但管制员及时发现了航班错误，立即通知机长改变航向，随后飞机掉头向东飞行。</p><p>　　昨天，俄罗斯全禄航空公司回应称，根据初步数据显示，该公司5月28日从北京飞往莫斯科的UN8888次航班，从北京机场起飞后偏离了航线。偏离航线主要因为录入机载数据错误。但其并没有明确具体是哪个环节造成的数据录入错误。</p><p>　　<b>回应：没有飞到禁飞区</b></p><p>　　根据航班当日飞行路线图，飞机从首都机场起飞后，向西南飞向市区，大约从东三环中路进入三环，在靠近二环东南角的地方转圈之后向东飞行。</p><p>　　俄罗斯全禄航空公司回应称，飞机并没有飞入禁飞区，也没有对机上乘客和居民造成威胁。</p><p>　　据了解，禁飞区又称禁航区，指某一领地的上空禁止任何未经特别申请许可的飞行器飞入或飞越的空域。此次，俄罗斯航班虽然没有飞进禁飞区，但闯进了东三环，已经进入了保护区。</p><p>　　全禄航空公司介绍，目前飞机偏离航线的情况已经上报给俄罗斯航空局。后期，俄罗斯航空局将进一步调查并给出结论。</p><p>　　作者：刘珜</p><p>　　（来源：北京青年报）</p><p>　　作者：刘珜</p><!--SPINFO#0-->";
    
    // Set up some variables for this specific template.
    NSDictionary *variables = @{@"normalFont":@"HY QiHei50", @"boldFont":@"HY QiHei70"
                                , @"theme":@"day", @"fontClass":@"font_normal", @"title":@"test", @"source":@"北青网-北京青年报", @"ptime":@"2015-05-30 02:30:29", @"_lang":@"zh", @"body":content };
    
    // Process the template and display the results.
    NSString *result = [engine processTemplateInFileAtPath:templatePath withVariables:variables];
    
    NSLog(@"%@", result);
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    [self.webView loadHTMLString:result baseURL:[NSURL fileURLWithPath:bundlePath]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

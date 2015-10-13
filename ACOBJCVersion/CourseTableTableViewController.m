//
//  CourseTableTableViewController.m
//  ACOBJCVersion
//
//  Created by LINCHUNGYAO on 2015/10/11.
//  Copyright © 2015年 LINCHUNGYAO. All rights reserved.
//

#import "CourseTableTableViewController.h"
#import "ShowRssContentViewController.h"

@interface CourseTableTableViewController (){
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *items;
    NSMutableString *titles;
    NSMutableString *links;
//    NSMutableString *comments;
    NSString *comparingElement;
}

@end

@implementation CourseTableTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];





    feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://www.alphacamp.co/feed/"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setExternalEntityResolvingPolicy:NO];
    [parser parse];  //called to start the event-driven parse.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse cell" forIndexPath:indexPath];
        //讀入title的標題後傳回cell輸出
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.layer.cornerRadius = 10;
//    NSLog(@"cell.textLabel.text =%@",cell.textLabel.text);

    return cell; //identifier of table view cell is "reuse cell"

}
    // 抓取標籤中開始的標籤
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{

    comparingElement = elementName;
//    NSLog(@"comparingElement=%@",comparingElement);
        //if find an element stat tag, initialize items,titles,links
    if ([comparingElement isEqualToString:@"item"]) {
        items = [[NSMutableDictionary alloc] init];
        titles = [[NSMutableString alloc] init];
        links = [[NSMutableString alloc] init];
//        comments = [[NSMutableString alloc] init];

    }
//    NSLog(@"breakpoint4");

}

    //取得結束標籤
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ( [elementName isEqualToString:@"item"] ) {
        [items setObject:titles forKey:@"title"];
        [items setObject:links forKey:@"link"];
//        [items setObject:comments forKey:@"comments"];

        [feeds addObject:[items copy]];
    }
}

    // 取得開始標籤與結束標籤間的內容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if ( [comparingElement isEqualToString:@"title"] ) {
         [titles appendString:string];
//          NSLog(@"titles=%@",string);
    }
    else if ( [comparingElement isEqualToString:@"link"] ){
              [links appendString:string];
//        NSLog(@"link=%@",string);
    }
//    else if ( [comparingElement isEqualToString:@"comments"] ){
//              [comments appendString:string];
//        NSLog(@"comments=%@",string);
//    }
}

    // sent when the parser has completed parsing. If this is encountered, the parse was successful.
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.tableView reloadData];
}

    //Override to support editing the table view
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if( editingStyle == UITableViewCellEditingStyleDelete){
//        Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@ [indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
            //        [feeds removeObject:cell];
        [feeds removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
    else if ( editingStyle == UITableViewCellEditingStyleInsert){
            //Create a new instance of the appropriate class, insert it into the array and add a new row to the table view
    }
  }


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"showRssContentSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *stringOfLink = [feeds[indexPath.row] objectForKey:@"link"];
//        NSLog(@"link=%@",stringOfLink);
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell=[self.tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [[segue destinationViewController] setUrl:stringOfLink];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIAlertView *messageAlert = [ [UIAlertView alloc] initWithTitle:@"選中此則訊息" message:nil delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil, nil];
//}
@end

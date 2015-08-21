//
//  iListMusicController.m
//  iPlayerTest
//
//  Created by BMX Studio on 8/20/15.
//  Copyright (c) 2015 BMX Studio. All rights reserved.
//

#import "iListMusicController.h"
#import "iPlayerController.h"

@interface iListMusicController ()

@end

@implementation iListMusicController
@synthesize ListMusic = _ListMusic;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ListMusic = [[NSMutableArray alloc] initWithObjects:@"mysong",@"Gia Nhu - Noo Phuoc Thinh", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //iPlayerController* svc =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"];
    //svc.string = [self.ListMusic objectAtIndex:indexPath.row];
    //UINavigationController *abc = [[UINavigationController alloc] initWithRootViewController:svc];
    int index1 = indexPath.row;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[iPlayerController shareInstance]];
    [self presentViewController:nav animated:YES completion:nil];
    [[iPlayerController shareInstance]loadSounds:self.ListMusic atIndex:index1];
    //[self presentViewController:[[UINavigationController alloc] initWithRootViewController:[iPlayerController shareInstance]] animated:YES completion:nil];
    
}

- (IBAction)buttonPlayer:(id)sender
{
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[iPlayerController shareInstance]] animated:YES completion:nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.ListMusic.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *listMusicIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listMusicIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listMusicIdentifier];    }
    // Configure the cell...
    cell.textLabel.text = [self.ListMusic objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

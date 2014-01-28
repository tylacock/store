//
//  SearchViewController.m
//  StoreSearch
//
//  Created by Lacock, Ty on 1/28/14.
//  Copyright (c) 2014 TWL. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// Temp stuff
@property (strong, nonatomic)NSMutableArray *searchResults;

@end

@implementation SearchViewController

///////////////////////////////////////////////////////////////////////////////
#pragma mark -  Life Cycle
///////////////////////////////////////////////////////////////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


///////////////////////////////////////////////////////////////////////////////
#pragma mark -  Table View and Data Source
///////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchResults == nil) {
        return 0;
    } else {
        return [self.searchResults count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SearchResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.searchResults[indexPath.row];
    
    return cell;
}

///////////////////////////////////////////////////////////////////////////////
#pragma mark -  Search Bar
///////////////////////////////////////////////////////////////////////////////

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchResults = [NSMutableArray arrayWithCapacity:20];
    
    for (int i = 0; i < 3; i++) {
        [self.searchResults addObject:[NSString stringWithFormat:@"Fake result %d for '%@'", i, searchBar.text]];
    }
    
    [self.tableView reloadData];
}
@end

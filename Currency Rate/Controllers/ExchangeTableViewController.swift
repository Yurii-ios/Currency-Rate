//
//  ExchangeTableViewController.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import UIKit

class ExchangeTableViewController: UITableViewController {
    
    private var exchangeViewCellViewModel: ExchangeViewCellViewModel?
    
    var notification = Notifications()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navBarLargeTitle()
        // test notification
        notification.scheduleNotification(notification: "Currency Rate")
    }
    
    private func navBarLargeTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setup() {
        NetworkDataFetcher().fetch(urlString: NetworkConstant.url) { (rates) in
            if let rates = rates {
                self.exchangeViewCellViewModel = ExchangeViewCellViewModel(rates: rates)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

//MARK: - TABLE DELEGATE AND DATA SOURCE
extension ExchangeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = exchangeViewCellViewModel else { return 0 }
        return viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.cellIdentifier, for: indexPath) as? ExchangeTableViewCell, let viewModel = exchangeViewCellViewModel else {
            fatalError("ExchangeTableViewCell not found")
        }
       
        let rateVM = viewModel.rateAtIndex(indexPath.row)
        // add flags to currency
        let countryFlags = AppConstants.flags[indexPath.row]
        
        cell.currencyLabel.text =  countryFlags + rateVM.currency
        cell.currencyValueLabel.text = rateVM.currencyValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = exchangeViewCellViewModel else { return }
        
        viewModel.selectRow(atIndexPath: indexPath)
        
        performSegue(withIdentifier: AppConstants.exchangeDetailSegue, sender: nil)
    }
    
    //MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indentifier = segue.identifier, let viewModel = exchangeViewCellViewModel else { return }
        
        if indentifier == AppConstants.exchangeDetailSegue {
            if let destinationVC = segue.destination as? ExchangeDetailVC { //ExchangeDetailViewController {
                destinationVC.exchangeDetailViewModel = viewModel.viewModelForSelectedRow()
               // destinationVC.label.text = "hbbhn"
                
            }
        }
    }
    
}

//
//  ExchangeDetailVC.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import UIKit

class ExchangeDetailVC: UIViewController {
    
    @IBOutlet weak var currencyDetailLabel: UILabel!
    
    @IBOutlet weak var lastCurrencyLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var exchangeDetailViewModel: DetailViewModelType?
    
    private var dataStore = DataStore()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = exchangeDetailViewModel else { return }
        self.currencyDetailLabel.text = viewModel.currencyDetail
        self.lastCurrencyLabel.text = dataStore.getStringFromCache()
    }
    
    @IBAction func saveValueButton(_ sender: UIButton) {
        showAlert()
        guard let viewModel = exchangeDetailViewModel else { return }
        dataStore.saveStringInCache(name: viewModel.currencyDetail)
        
        delay(delay: 1) { [weak self] in
            self?.lastCurrencyLabel.text = self?.dataStore.getStringFromCache()
        }
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    private func showAlert() {
         let alert = UIAlertController(title: "Success", message: "This currency rate has been saved, when it changes, you will receive a notification", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }
}

//
//  ViewController.swift
//  cryptoChecker
//
//  Created by Danil Bochkarev on 24.08.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    var cryptoName = [
        "🔘 BTC",  
        "🔘 ETH",
        "🔘 BNB",
        "🔘 XRP",
        "🔘 ADA",
        "🔘 SOL",
        "🔘 DOGE",
        "🔘 DOT",
        "🔘 SHIB",
        "🔘 AVAX"
    ]
    
    var currencyName = [
        "USD 🇺🇸",
        "RUB 🇷🇺",
        "UAH 🇺🇦",
        "JPY 🇯🇵",
        "EUR 🇪🇺",
        "THB 🇨🇷",
        "GBP 🇬🇧",
        "KRW 🇰🇷",
        "TRY 🇹🇷",
        "BRL 🇧🇷"
    ]
    
    var selectedElementOne: String?
    var selectedElementTwo: String?
    
    
    @IBOutlet weak var selectCurrencies: UIPickerView!
    @IBOutlet weak var seeResult: UIButton!
    
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Определяем цвет тени
        seeResult.layer.shadowColor = UIColor.black.cgColor
         // Радиус размытия тени
        seeResult.layer.shadowRadius = 5.0
         // Смещение тени
        seeResult.layer.shadowOffset = CGSize(width: 1, height: 1)
         // Прозрачность тени, по умолчанию 0, тень не будет отображаться, если она не установлена ​​****
        seeResult.layer.shadowOpacity = 0.9
        
        selectCurrencies.dataSource = self
        selectCurrencies.delegate = self
    }
    



    @IBAction func seeAction(_ sender: UIButton) {
        
        print("tapped success")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? WebViewController else { return }
        dvc.currencyValue = selectedElementOne
        dvc.cryptoValue = selectedElementTwo
    }
    
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cryptoName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let crypto = cryptoName[row]
            return crypto
        } else {
            let currency = currencyName[row]
            return currency
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedElementTwo = cryptoName[row]
        } else {
            selectedElementOne = currencyName[row]
        }
    }
}

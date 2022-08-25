//
//  WebViewController.swift
//  cryptoChecker
//
//  Created by Danil Bochkarev on 25.08.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var pairCryptoAndCurrency: UILabel!
    @IBOutlet weak var backLabel: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var currencyValue: String?
    var cryptoValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a1 = cryptoValue!
        let a2 = currencyValue!
        
        let result1 = String(a1.dropFirst(2))
        let result2 = String(a2.dropLast(2))

        pairCryptoAndCurrency.text = result1 + " 📊 " + result2 //(🔘 BTC)(USD 🇺🇸)
        

        backLabel.layer.shadowColor = UIColor.black.cgColor
         // Радиус размытия тени
        backLabel.layer.shadowRadius = 5.0
         // Смещение тени
        backLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
         // Прозрачность тени, по умолчанию 0, тень не будет отображаться, если она не установлена ​​****
        backLabel.layer.shadowOpacity = 0.9
        
        
        //создание открытия ссылки
        let homePage = "https://ru.tradingview.com/symbols/\(result1)\(result2)/"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

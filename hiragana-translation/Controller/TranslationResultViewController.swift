//
//  TranslationResultViewController.swift
//  hiragana-translation
//
//  Created by 鈴木孝伸 on 2019/07/07.
//  Copyright © 2019 鈴木孝伸. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TranslationResultViewController: UIViewController {

    @IBOutlet var beforeTranslationLabel: UILabel!
    @IBOutlet var afterTranslationLabel: UILabel!
    @IBOutlet var connectionLabel: UILabel!
    @IBOutlet var navigationTitle: UINavigationItem!
    
    var sentence:String = ""
    let resultDataModel = ResultDataModel()
    var inputText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle.title = "変換結果画面"
        beforeTranslationLabel.text = inputText
        sentence = inputText!
        HttpRequest()
        
        let viewSize = self.view.frame.size
        beforeTranslationLabel.numberOfLines = 0
        beforeTranslationLabel.sizeToFit()
    }
    
    func HttpRequest() {
        let url = "https://labs.goo.ne.jp/api/hiragana"
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Contenttype": "application/x-www-form-urlencoded"
        ]
        let parameters:[String: Any] = [
            "sentence": sentence,
            "app_id": "e92fd7b7754298d501523c2b4612275e854677a8adbf3b4184ff173464297afc",
            "output_type": "hiragana"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let result = response.result.value as? [String: Any] {
                let translationResultJSON :JSON = JSON(result)
                self.resultDataModel.translationResult = translationResultJSON["converted"].stringValue
                self.afterTranslationLabel.text = self.resultDataModel.translationResult
                self.connectionLabel.text = ""
            }else{
                print("Error\(String(describing: response.result.error))")
                self.connectionLabel.text = "ネットワークエラー"
            }
        }
    }



}

//
//  ViewController.swift
//  hiragana-translation
//
//  Created by 鈴木孝伸 on 2019/07/06.
//  Copyright © 2019 鈴木孝伸. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var sentence:String = "有難い"

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
                print(result)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HttpRequest()
    }


}


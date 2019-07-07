//
//  ViewController.swift
//  hiragana-translation
//
//  Created by 鈴木孝伸 on 2019/07/06.
//  Copyright © 2019 鈴木孝伸. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet var japaneseTextField: UITextField!
    @IBOutlet var navigationTitle: UINavigationItem!
    @IBOutlet var errorText: UILabel!
    
    let translationResultVC = TranslationResultViewController()
    var textCountResult = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle.title = "入力画面"
        errorText.alpha = 0
    }
    
    @IBAction func translationButtonPressed(_ sender: Any) {
        textCountResult = textFieldCheck(japaneseTextField)
        if textCountResult == false{ return }
        
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let translationResultVC: TranslationResultViewController = (segue.destination as? TranslationResultViewController)!
            translationResultVC.inputText = japaneseTextField.text!
        }
    }
    
//    画面に収まりきるように25文字以内で入力してもらう
//    入力フォームが空じゃないかどうかチェック
    func textFieldCheck(_ textField: UITextField) -> Bool {
        if textField.text!.count <= 0 {
            errorText.text = "文字が入力されていません"
            errorText.alpha = 1
            return false
        }else if textField.text!.count > 25 {
            errorText.text = "25文字以内で入力して下さい"
            errorText.alpha = 1
            return false
        }
        errorText.alpha = 0
        return true
    }
}


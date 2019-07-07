//
//  ViewController.swift
//  hiragana-translation
//
//  Created by 鈴木孝伸 on 2019/07/06.
//  Copyright © 2019 鈴木孝伸. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    let translationResultVC = TranslationResultViewController()
    @IBOutlet var japaneseTextField: UITextField!
    @IBOutlet var navigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle.title = "入力画面"
    }
    
    @IBAction func translationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let translationResultVC: TranslationResultViewController = (segue.destination as? TranslationResultViewController)!
            translationResultVC.inputText = japaneseTextField.text!
        }
    }
}


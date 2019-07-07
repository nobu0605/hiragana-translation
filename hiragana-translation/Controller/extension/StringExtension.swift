//
//  StringExtension.swift
//  hiragana-translation
//
//  Created by 鈴木孝伸 on 2019/07/07.
//  Copyright © 2019 鈴木孝伸. All rights reserved.
//

import Foundation

extension String {
    /// StringからCharacterSetを取り除く
    func remove(characterSet: CharacterSet) -> String {
        return components(separatedBy: characterSet).joined()
    }
}

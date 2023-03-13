//
//  Labels.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 11.03.2023.
//

import UIKit

class InfoLabels: UILabel {
    init(inform: String, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        super.init(frame: .zero)
        text = inform
        textColor = color
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: size, weight: weight)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class regTextField: UITextField {
    init(placeholderText: String, typeKeyBoard: UIKeyboardType, isSecureText: Bool) {
        super.init(frame: .zero)
        placeholder = placeholderText
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        backgroundColor = .earlGrey
        layer.cornerRadius = 15
        autocapitalizationType = .none
        textAlignment = .center
        keyboardType = typeKeyBoard
        isSecureTextEntry = isSecureText
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

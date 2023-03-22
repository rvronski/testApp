//
//  Color.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 11.03.2023.
//

import UIKit

extension UIColor {
    static var buttonColor: UIColor = #colorLiteral(red: 0.3052096963, green: 0.3318368793, blue: 0.8421060443, alpha: 1)
    static var backgroundColor: UIColor = #colorLiteral(red: 0.9803897738, green: 0.9764357209, blue: 1, alpha: 1)
    static var earlGrey: UIColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
    static var eyes: UIColor = #colorLiteral(red: 0.3607842922, green: 0.3607842922, blue: 0.3607842922, alpha: 1)
    
}

class CustomSearchBar: UISearchBar {
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundImage = UIImage()
        let searchTextField:UITextField = self.searchTextField
        searchTextField.textAlignment = .left
        searchTextField.layer.cornerRadius = 20
        searchTextField.layer.masksToBounds = true
        setSearchFieldBackgroundImage(UIImage(named: "backgroundImage"), for: .normal)
        searchTextField.leftView = nil
        searchTextField.placeholder = "      What are you looking for?"
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}

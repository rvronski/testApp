//
//  ProfileView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 13.03.2023.
//

import UIKit

class ProfileView: UIView {
    
    private lazy var avatarImage = CustomImageView(imageName: "")
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

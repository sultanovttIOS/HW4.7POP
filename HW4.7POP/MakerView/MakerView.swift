//
//  MakerView.swift
//  HW4.7POP
//
//  Created by Alisher Sultanov on 5/2/24.
//

import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makerTf(placeholder: String,
                  textColor: UIColor = .black,
                  leftViewMode: UITextField.ViewMode = .always,
                  cornerRadius: CGFloat,
                  backgroundColor: UIColor,
                  keyboardType: UIKeyboardType = .numberPad) -> UITextField {
        
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = textColor
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 4))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.keyboardType = keyboardType
        
        return tf
    }
    
    func makerLabel(text: String? = nil,
                    font: UIFont,
                    textColor: UIColor,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }

    func makerImageView(imageName: String? = nil,
                        cornerRadius: CGFloat,
                        clipsToBounds: Bool = true,
                        contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView {
        let imageView = UIImageView()
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = clipsToBounds
        imageView.contentMode = contentMode
        
        return imageView
    }
    
    func makerButton(title: String = "",
                     for state: UIControl.State = .normal,
                     imageName: String? = nil,
                     tintColor: UIColor,
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat,
                     isEnabled: Bool = true) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: state)
        button.setImage(imageName != nil ? UIImage(named: imageName!) : nil, for: .normal)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.isEnabled = isEnabled
        return button
    }
    
    func makerView(cornerRadius: CGFloat,
                   clipsToBounds: Bool = true,
                   backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = clipsToBounds
        view.backgroundColor = backgroundColor
        return view
    }
}


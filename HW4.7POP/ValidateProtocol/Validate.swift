//
//  Validate.swift
//  HW4.7POP
//
//  Created by Alisher Sultanov on 6/2/24.
//

import UIKit

protocol TransferProtocol {
    
    func validateCardNumber(tf: UITextField) -> Bool
    func validateSumTransfer(tf: UITextField, balance: Double, transferSum: Double) -> Bool
}

extension TransferProtocol {
    
    func validateCardNumber(tf: UITextField) -> Bool {
        if tf.text?.count == 16 && tf.text?.allSatisfy({ $0.isNumber }) == true {
            tf.layer.borderColor = .none
            tf.layer.borderWidth = 0
            return true
        } else {
            tf.layer.borderWidth = 2
            tf.layer.cornerRadius = 12
            tf.layer.borderColor = UIColor.red.cgColor
            return false
        }
    }
    
    func validateSumTransfer(tf: UITextField, balance: Double, transferSum: Double) -> Bool {
        if transferSum >= 20 && transferSum <= balance {
            tf.layer.borderColor = .none
            tf.layer.borderWidth = 0
            return true
        } else {
            tf.attributedPlaceholder = NSAttributedString(string: "Сумма должна быть от 20 - \(balance).",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            tf.layer.borderWidth = 2
            tf.layer.cornerRadius = 12
            tf.layer.borderColor = UIColor.red.cgColor
            return false
        }
    }
}

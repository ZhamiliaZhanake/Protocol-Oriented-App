//
//  Protocol.swift
//  pop
//
//  Created by Zhamilia Zhanakeeva on 8/3/24.
//

import UIKit

protocol TextFieldValidation {
    func validateTextField(textField: UITextField) -> Bool
    func showValidationError(textField: UITextField)
}

extension TextFieldValidation where Self: UIViewController {
    func showValidationError(textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 3.0
    }
}


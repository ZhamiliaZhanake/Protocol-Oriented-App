//
//  AgeViewController.swift
//  pop
//
//  Created by Zhamilia Zhanakeeva on 8/3/24.
//

import UIKit

class AgeViewController: UIViewController, TextFieldValidation {
    private let questionLabel = MakerView.shared.makerLabel(text: "When were you born?", size: 30)
    private let image = MakerView.shared.makerImageView(image: UIImage(named: "age"))
    private let ageTF = MakerView.shared.makerTextField(placeholder: "Age")
    private let finishButton = MakerView.shared.makerButton(title: "Finish", backgroundColor: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupUI()
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
        view.addSubview(ageTF)
        NSLayoutConstraint.activate([
            ageTF.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            ageTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageTF.heightAnchor.constraint(equalToConstant: 50),
            ageTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(finishButton)
        NSLayoutConstraint.activate([
            finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 50),
            finishButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func finishButtonTapped() {
        if validateTextField(textField: ageTF) {
            showSuccessAlert()
        } else {
            showValidationError(textField: ageTF)
        }
    }
    
    func validateTextField(textField: UITextField) -> Bool {
        let isValid = !ageTF.text!.isEmpty
        if isValid {
            ageTF.layer.borderColor = UIColor.clear.cgColor
            ageTF.layer.borderWidth = 0.0
        } else {
            showValidationError(textField: ageTF)
        }
        return isValid
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Success!", message: "All your data is saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}





//
//  ViewController.swift
//  pop
//
//  Created by Zhamilia Zhanakeeva on 7/3/24.
//

import UIKit

class NameViewController: UIViewController, TextFieldValidation {
    private let questionLabel = MakerView.shared.makerLabel(text: "What is your name?", size: 30)
    private let image = MakerView.shared.makerImageView(image: UIImage(named: "name"))
    private let nameTF = MakerView.shared.makerTextField(placeholder: "Name")
    private let nextButton = MakerView.shared.makerButton(title: "Next", backgroundColor: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupUI()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
        view.addSubview(nameTF)
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTF.heightAnchor.constraint(equalToConstant: 50),
            nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func nextButtonTapped() {
        if validateTextField(textField: nameTF) {
            let vc = SkillsViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            showValidationError(textField: nameTF)
        }
    }
    
    func validateTextField(textField: UITextField) -> Bool {
        return !nameTF.text!.isEmpty
    }
}

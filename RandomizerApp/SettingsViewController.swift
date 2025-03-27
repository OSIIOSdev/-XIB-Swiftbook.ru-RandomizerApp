//
//  SettingsViewController.swift
//  RandomizerApp
//
//  Created by OSIIOSdev on 27.03.2025.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var minimumValueTextField: UITextField!
    @IBOutlet var maximumValueTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    
    // MARK: - Private properties
    
    var minimumValue = ""
    var maximumValue = ""
    
    
    // MARK: - View LifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()

        minimumValueTextField.text = minimumValue
        maximumValueTextField.text = maximumValue
        
        getButtonSettings(for: saveButton, withTitle: "Save")
        getButtonSettings(for: cancelButton, withTitle: "Cancel")
        
    }
    
    
    // MARK: - Override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super .touchesBegan(touches, with: event)
        
        view.endEditing(true)
        
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func cancelButtonPressed() {
        
        dismiss(animated: true)
        
    }
    
    
    // MARK: - Private methods
    
    private func getButtonSettings(for button: UIButton, withTitle: String) {
        
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.setTitle(withTitle, for: .normal)
        
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
}

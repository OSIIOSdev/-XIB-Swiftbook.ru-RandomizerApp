//
//  ViewController.swift
//  RandomizerApp
//
//  Created by OSIIOSdev on 27.03.2025.
//

import UIKit

final class RandomizerViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    
    @IBOutlet var getResultButton: UIButton!
    
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getButtonSettings(for: getResultButton)
        getLabelSettings(for: minimumValueLabel, withSize: 35)
        getLabelSettings(for: maximumValueLabel, withSize: 35)
        getLabelSettings(for: randomValueLabel, withSize: 150)
        
    }
    
    
    // MARK: - Override methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let settingsViewController = segue.destination as? SettingsViewController else { return }
        
        settingsViewController.minimumValue = minimumValueLabel.text ?? ""
        settingsViewController.maximumValue = maximumValueLabel.text ?? ""
        
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func getResultButtonPressed() {
        
        let minimumValue = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumValue = Int(maximumValueLabel.text ?? "") ?? 0
        
        randomValueLabel.text = Int.random(in: minimumValue...maximumValue).formatted()
        
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let settingsViewController = segue.source as? SettingsViewController else { return }
        
        minimumValueLabel.text = settingsViewController.minimumValueTextField.text
        maximumValueLabel.text = settingsViewController.maximumValueTextField.text
        
    }
    
    
    // MARK: - Private methods
    
    private func getLabelSettings(for label: UILabel, withSize: CGFloat) {
        
        label.font = UIFont.systemFont(ofSize: withSize, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    private func getButtonSettings(for button: UIButton) {
        
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.setTitle("Get Result", for: .normal)
        
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
}


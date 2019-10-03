//
//  ViewController.swift
//  CommissionCalculator
//
//  Created by Casualty on 7/17/19.
//  Copyright © 2019 Casualty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCommissionLabel: UILabel!
    @IBOutlet weak var salesTextField: UITextField!
    @IBOutlet weak var calculateCommissionButton: UIButton!
    @IBOutlet weak var tierOneTextLabel: UILabel!
    @IBOutlet weak var tierTwoTextLabel: UILabel!
    @IBOutlet weak var tierOne: UILabel!
    @IBOutlet weak var tierTwo: UILabel!
    @IBOutlet weak var tierThree: UILabel!
    @IBOutlet weak var tierThreeTextLabel: UILabel!
    
    var greenText: UIColor = UIColor(displayP3Red: 0, green: 100/150, blue: 5/150, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabels()
        styleButton()
    }
    
    func hideLabels() {
        totalCommissionLabel.text = nil
        tierOneTextLabel.text = nil
        tierTwoTextLabel.text = nil
        tierThreeTextLabel.text = nil
        tierOne.text = nil
        tierTwo.text = nil
        tierThree.text = nil
    }

    func styleButton() {
        calculateCommissionButton.layer.cornerRadius = 5
    }
    @IBAction func calculateCommissionButtonPressed(_ sender: Any) {
        guard let salesValueString = salesTextField.text else { return }
        
        guard let salesValue = Double(salesValueString) else {
            print("Invalid number")
            
            return
    
        }
        
        func calculateCommission() {
            
            salesTextField.endEditing(true)
            
            var newSalesValue: Double = salesValue
            var firstTierCommission: Double
            var secondTierCommission: Double
            var thirdTierCommission: Double
            let defaultValue: String = "$833.40"
    
            
            if newSalesValue >= 125_001 {
                tierOneTextLabel.text = defaultValue
                tierTwoTextLabel.text = defaultValue
                newSalesValue = salesValue - 125_001
                thirdTierCommission = newSalesValue * 0.025
                tierThreeTextLabel.text = "$\(String(format:"%.2f", thirdTierCommission))"
                secondTierCommission = 833.40
                firstTierCommission = 833.40
                newSalesValue = thirdTierCommission + secondTierCommission + firstTierCommission
                totalCommissionLabel.text = "$\(String(format:"%.2f", newSalesValue))"
                tierOne.text = "Tier 1"
                tierTwo.text = "Tier 2"
                tierThree.text = "Tier 3"
                totalCommissionLabel.textColor = greenText
                
            } else if newSalesValue > 83_334 {
                tierOneTextLabel.text = defaultValue
                newSalesValue = salesValue - 83_334
                secondTierCommission = newSalesValue * 0.02
                firstTierCommission = 833.40
                newSalesValue = secondTierCommission + firstTierCommission
                totalCommissionLabel.text = "$\(String(format:"%.2f", newSalesValue))"
                tierTwoTextLabel.text = "$\(String(format:"%.2f", secondTierCommission))"
                tierOne.text = "Tier 1"
                tierTwo.text = "Tier 2"
                tierThree.text = nil
                tierThreeTextLabel.text = nil
                totalCommissionLabel.textColor = .label
            } else {
                firstTierCommission = newSalesValue * 0.01
                totalCommissionLabel.text = "$\(String(format:"%.2f", firstTierCommission))"
                tierOneTextLabel.text = "$\(String(format:"%.2f", firstTierCommission))"
                totalCommissionLabel.textColor = .label
                tierOne.text = "Tier 1"
                tierTwo.text = nil
                tierTwoTextLabel.text = nil
                tierThree.text = nil
                tierThreeTextLabel.text = nil
            }
        }
        
        calculateCommission()
        
    }
    
}


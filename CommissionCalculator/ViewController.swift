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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalCommissionLabel.text = nil
        calculateCommissionButton.layer.cornerRadius = 5
        view.backgroundColor = .black
        totalCommissionLabel.textColor = .white
        tierOneTextLabel.textColor = .white
        tierTwoTextLabel.textColor = .white
        tierThreeTextLabel.textColor = .white
        tierOne.textColor = .white
        tierTwo.textColor = .white
        tierThree.textColor = .white
        tierOneTextLabel.text = nil
        tierTwoTextLabel.text = nil
        tierThreeTextLabel.text = nil
        
    }

    @IBAction func calculateCommissionButtonPressed(_ sender: Any) {
        guard let salesValueString = salesTextField.text else { return }
        
        guard let salesValue = Double(salesValueString) else {
            print("Invalid number")
            return
    
        }
        
        func calculateCommission() {
            
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
                tierThreeTextLabel.text = "$\(thirdTierCommission)"
                secondTierCommission = 833.40
                firstTierCommission = 833.40
                newSalesValue = thirdTierCommission + secondTierCommission + firstTierCommission
                totalCommissionLabel.text = "$\(newSalesValue)"
                totalCommissionLabel.textColor = .green
                
            } else if newSalesValue > 83_334 {
                tierOneTextLabel.text = defaultValue
                tierThreeTextLabel.text = nil
                newSalesValue = salesValue - 83_334
                secondTierCommission = newSalesValue * 0.02
                firstTierCommission = 833.40
                newSalesValue = secondTierCommission + firstTierCommission
                totalCommissionLabel.text = "$\(newSalesValue)"
                tierTwoTextLabel.text = "$\(secondTierCommission)"
            } else {
                tierTwoTextLabel.text = nil
                tierThreeTextLabel.text = nil
                firstTierCommission = newSalesValue * 0.01
                totalCommissionLabel.text = "$\(firstTierCommission)"
                tierOneTextLabel.text = "$\(firstTierCommission)"
                
            }
        }
        
        calculateCommission()
        
    }
    
}


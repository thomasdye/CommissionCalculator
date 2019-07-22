# Commission Calculator is an example calculator for tiered commission

## Tier 1 - Sales under $83,333
For sales between $0 and $83,333, total commission is 1%

Tier1 is the total

## Tier 2 - Sales over $83,333 but less than $125,000
For sales between $0 and $83,333, total commission is 1%
For sales between $83,334 and $125,000 total commission is 2%

Combine Tier1 and Tier2 for total

## Tier 3 - Sales over $125,000
For sales between $0 and $83,333, total commission is 1%
For sales between $83,334 and $125,000 total commission is 2%
For sales over $125,001 total commission is 2.5%

Combine Tier1, Tier2, and Tier3 for total

```Swift
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
```

<img src="Commission Calculator.gif" height="500px">

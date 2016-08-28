//
//  ConvertionViewController.swift
//  WorldTrotter
//
//  Created by Jeff Meehan on 8/28/16.
//  Copyright © 2016 Jeff Meehan. All rights reserved.
//

import UIKit


class ConvertionViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet var celsiusLabel: UILabel!
	@IBOutlet var textField: UITextField!
	@IBOutlet var isReallyLabel: UILabel!
	
	@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
		if let text = textField.text, value = Double(text) {
			fahrenheitValue = value
		} else {
			fahrenheitValue = nil
		}
	}
	
	@IBAction func dismissKeyboard(sender: AnyObject) {
		textField.resignFirstResponder()
	}
	
	var fahrenheitValue: Double? {
		didSet {
			updateCelsiusLabel()
		}
	}
	
	var celsiusValue: Double? {
		if let value = fahrenheitValue {
			return (value - 32) * (5/9)
		} else {
			return nil
		}
	}
	
	let numberFormatter: NSNumberFormatter = {
		let nf = NSNumberFormatter()
		nf.numberStyle = .DecimalStyle
		nf.minimumFractionDigits = 0
		nf.maximumFractionDigits = 1
		return nf
	} ()
	
	func updateCelsiusLabel() {
		if let value = celsiusValue {
			celsiusLabel.text = numberFormatter.stringFromNumber(value)
		} else {
			celsiusLabel.text = "???"
		}
	}
	
	func textField(textField: UITextField,
	               shouldChangeCharactersInRange range: NSRange,
	                                             replacementString string: String) -> Bool {

		let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
		let replacementTextHasDecimalSeparator = string.rangeOfString(".")
		let decimalCharacterSet = NSCharacterSet(
			charactersInString: "0123456789.\u{8}")
		
		if string.rangeOfCharacterFromSet(decimalCharacterSet.invertedSet) != nil {
			return false
		} else if existingTextHasDecimalSeparator != nil &&
			replacementTextHasDecimalSeparator != nil {
			return false
		} else {
			return true
		}
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("ConvertionViewController loaded its view")
	}
	
	override func viewWillAppear(animated: Bool) {
		let calendar = NSCalendar.currentCalendar()
		let hour = calendar.component(.Hour, fromDate: NSDate())
		
		let lightColor = UIColor.init(red: 0.961, green: 0.957, blue: 0945, alpha: 1)
		let darkColor = UIColor.init(red: 0.184, green: 0.184	, blue: 0.188, alpha: 1)

		
		switch hour {
		case 8...18:
			isReallyLabel.textColor = UIColor.blackColor()
			view.backgroundColor = lightColor
		default:
			let string = NSAttributedString(string: "Value", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
			textField.attributedPlaceholder = string
			isReallyLabel.textColor = UIColor.whiteColor()
			view.backgroundColor = darkColor
		}
	}
	
}


//
//  ViewController.swift
//  cccc
//
//  Created by Джамал Гумасов on 19.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel! {
          didSet {
              self.labelResult.text = ""
       }
 }
        var fisrtNumber : Double = 0
        var secondNumber : Double = 0
        var selectedуOperator : String = ""
    @IBAction func numberPressed(_ sender:  UIButton) {
        labelResult.text? += String(sender.tag)
    }
    @IBAction func dotButtonPressed(_ sender: Any) {
        labelResult.text? += "."
        }
    @IBAction func operatonPressed(_ sender: UIButton) {
          guard let number = Double(labelResult.text ?? "0") else { return }
        func arithmeticmethods()  {
            fisrtNumber = number
            labelResult.text = ""
        }
          switch sender.tag {
          case 0 : // =
              secondNumber = number
              calculation(selectedуOperator)
              arithmeticmethods()
          case 1:
              selectedуOperator = "+"
              arithmeticmethods()
          case 2:
              selectedуOperator = "-"
              arithmeticmethods()
          case 3:
              selectedуOperator = "X"
              arithmeticmethods()
          case 4:
              selectedуOperator = "÷"
              arithmeticmethods()
          case 5:
              selectedуOperator = "%"
              arithmeticmethods()
          default:
              break
          }
    }
    func clearCalculation() {
        self.selectedуOperator = ""
        fisrtNumber = 0
        secondNumber = 0
        labelResult.text = ""
    }
    @IBAction func plusMinusButtonPressed(_ sender: Any) {
             guard let number = Double(labelResult.text ?? "0") else { return }
             switch number.sign {
             case .minus:
                 labelResult.text = abs(number).debugDescription
             case .plus:
                 labelResult.text = "-" + abs(number).debugDescription
         }
      }
    @IBAction func clearButtonPressed(_ sender: Any) {
         clearCalculation()
     }
    func calculation(_ selectedOperator : String) {
        guard !selectedOperator.isEmpty else {
            labelResult.text = ""
            return
        }
            switch selectedOperator {
            case "+" :
                labelResult.text = (fisrtNumber + secondNumber).clean
            case "-" :
                labelResult.text = (fisrtNumber - secondNumber).clean
            case "X" :
                labelResult.text = (fisrtNumber * secondNumber).clean
            case "÷" :
                labelResult.text = (fisrtNumber / secondNumber).clean
            case "%" :
                labelResult.text = (fisrtNumber.truncatingRemainder(dividingBy: secondNumber)).clean
            default:
                break
            }
        }
    }
extension Double {
        var clean: String {
            return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
        }
}

//
//  ViewController.swift
//  HelloUIPickerView
//
//  Created by 洪德晟 on 2016/9/29.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPickerView: UIPickerView!

    @IBAction func showMeinfo(_ sender: UIButton) {
        print("\(myPickerView.selectedRow(inComponent: 0))")
    }
    
    let numberArray = ["1", "2", "3","4", "5", "6", "7", "8"]
    let fruitArray = ["apple", "banana", "mango", "watermelon"]

    // MARK: - UIPickerViewDataSource
    
    // 選單有幾類的選項
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 某一類的選項，有幾項
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 第0個component，有4列
        if component == 0 {
            return numberArray.count
        } else {
            return fruitArray.count
        }
    }
    
    // MARK: - UIPickerViewDelegate
    
    // 回答要顯示的文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return numberArray[row]
        } else {
            return fruitArray[row]
        }
    }
    
    // 選到某一列會執行的方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print("number: \(numberArray[row])")
        } else {
            print("fruit: \(fruitArray[row])")
        }
    }
    
    // Addition1: 改變字體顏色
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        if component == 0 {
//            let titleData = numberArray[row]
//            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 40.0),NSForegroundColorAttributeName:UIColor.red])
//            return myTitle
//        } else {
//            let titleData = fruitArray[row]
//            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 40.0),NSForegroundColorAttributeName:UIColor.blue])
//            return myTitle
//        }
//    }
    
    // Addition2: 改變字體顏色 by UILabel
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 0 {
            // 省資源的寫法
            var pickerLabel = view as! UILabel!
            if view == nil {  //if no label there yet
                pickerLabel = UILabel()
                //color the label's background
                let hue = CGFloat(row)/CGFloat(numberArray.count)
                pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            }
            let titleData = numberArray[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!,NSForegroundColorAttributeName:UIColor.white])
            //color  and center the label's background
            pickerLabel!.attributedText = myTitle
            pickerLabel!.textAlignment = .center
            // 圓角
            pickerLabel!.layer.masksToBounds = true
            pickerLabel!.layer.cornerRadius = 5.0
            return pickerLabel!
            
        } else {
            let pickerLabel = UILabel()
            let titleData = fruitArray[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Chalkduster", size: 20.0)!,NSForegroundColorAttributeName:UIColor.brown])
            pickerLabel.attributedText = myTitle
            pickerLabel.textAlignment = .center
            return pickerLabel
        }
    }
    
    // Addition: 改變高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    // Addition: 改變寬度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 100
        } else {
            return 150
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myPickerView.selectRow(3, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


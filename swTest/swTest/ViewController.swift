//
//  ViewController.swift
//  swTest
//
//  Created by LIM on 31.05.2015.
//  Copyright (c) 2015 LIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, testUrlDelegate {
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var testButtomn: UIButton!
    @IBOutlet var muchTest: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        //textField.returnKeyType = UIReturnKeyType.done;
        
        //muchTest.delegate = self
        //muchTest.returnKeyType = UIReturnKeyType.done
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickTest(_ sender: Any) {
        //self.testExpre()
        let r = testUrl()
        r.delegate = self
        r.go()
    }
    
    @IBAction func strTesting(_ sender: Any, forEvent event: UIEvent) {
        self.testingString()
        print(sender is UIButton)
    }
    
    @IBAction func gotosecond(_ sender: Any) {
        goToNext()
    }
    
    /*
    @IBAction func clickTest(sender: AnyObject, forEvent event: UIEvent) {
        
        self.testExpre()
    }
    @IBAction func stringtesting(sender: AnyObject, forEvent event: UIEvent) {
        self.testingString()
        print(sender is UIButton)
    }
 */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func getTestUrlResult(str: String) {
        muchTest.text = str
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let endName = segue.identifier {
        
            if endName == "gotonext" {
                let destiny = segue.destination as! SecondController
                destiny.nameTest = Date().description
            }
            else{
                super.prepare(for: segue, sender: sender)
            }
        }
        
    }
    
    func goToNext(){
        performSegue(withIdentifier: "gotonext", sender: nil)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func testExpre() -> Void {
        let arr = [["Manny", "Moe", "Jack"], ["Harpo", "Chico", "Groucho"]]
        let arr2 = arr.map {
            $0.filter {
                let found = $0.range(of: "m", options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)
                return (found != nil)
            }
            }.filter {$0.count > 0}
        
        let arr3 = arr.map{(current: [String]) -> [String] in current.filter{(oneValue: String) -> Bool in
            let found = oneValue.range(of: "m", options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)
            return (found != nil)
            }
        }.filter{(current: [String]) -> Bool in current.count > 0 }
        
        
        
        var output : String = ""
        var intTable: [Int] = [Int]()
        
        intTable.append(34)
        
        
        for firstArray in arr3{
            for val in firstArray{
                output += val;
            }
        }
        
        for firstArray in arr2{
            for val in firstArray{
                output += val;
            }
        }
        
        textField.text = output
        
    }
    
    func testingString() -> Void {
        
        let lable: String = "lol of "
        let width: Int = 98
        
        let endmisiek = lable + String(width)
        
        textField.text = endmisiek
        
        self.testArray()
    }
    
    func testArray() -> Void {
        var test = [String]()
        
        test.append("1")
        test.append("3")
        
        let test2 = test.map{ (current: String) -> String in current + "KOKO"}
        
        print(test2)
        
        let lol = Circle(radius: 12.2, name: "misio")
        
        print(lol.simpleDescription())
        
        let e = Suit.clubs.rawValue
    
        print(e)
        
        var shapeSet = Set<Shape>()
        
        shapeSet.insert(Shape(name: "Misiek"))
        shapeSet.insert(Shape(name: "Homis"))
        shapeSet.insert(Shape(name: "ASDASD"))
        
        shapeSet = Set<Shape>(shapeSet.sorted(by: <))
        
        for elem in shapeSet {
            print(elem.simpleDescription())
        }
    
    }
    
}


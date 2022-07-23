//
//  ViewController.swift
//  SolidPrinciple
//
//  Created by M1085568 on 15/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_title: UILabel!
    
//    override func loadView() {
//        print("loadView")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad1")
        
        let queue = DispatchQueue(label: "label")
        print("DispatchQueue1")
        queue.async {
            print("DispatchQueue2")

            queue.sync {
                print("DispatchQueue3")

                // outer block is waiting for this inner block to complete,
                // inner block won't start before outer block finishes
                // => deadlock
            }
            // this will never be reached
        }
        
        let serialQueue = DispatchQueue.init(label: "serialQueue")
        serialQueue.async {
            // code to execute
        }
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .milliseconds(500), qos: .utility, flags: .noQoS) {
            print("What is my QOS?")
            //self.lbl_title.text = "sdfsf"

        }
        
        DispatchQueue.global(qos: .userInitiated).sync {
          self.lbl_title.text = "sdfsf"

           print("backgoud")
          //lable.Text = "hello"
        }
       // print("print")
        
        
//        let locat = Logger()
//        locat.printData()
//
//        // Usage
//
//        let rectangle = Rectangle(width: 2, length: 5)
//        printArea(of: rectangle) // 10
//
//        let square = Square(side: 2)
//        printArea(of: square) // 4

        
        // Do any additional setup after loading the view.
    }
    @discardableResult
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear1")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear1")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews1")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear1")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear1")
    }
    
   
    
    
    @IBAction func btnclick_actions(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "secondclassVC") as! secondclassVC
     //   self.navigationController?.pushViewController(nextViewController, animated: true)
      self.present(nextViewController, animated:true, completion:nil)
        
    }
    
}

protocol Printable {
    func printDetails() -> String
}

class Logger {

    func printData() {
        let cars: [Printable] = [
            Car(name: "Batmobile", color: "Black"),
            Car(name: "SuperCar", color: "Gold"),
            Car(name: "FamilyCar", color: "Grey"),
            Bicycle(type: "BMX"),
            Bicycle(type: "Tandem")
        ]

        cars.forEach { car in
            print(car.printDetails())
        }
    }
}

class Car: Printable {
    let name: String
    let color: String

    init(name: String, color: String) {
        self.name = name
        self.color = color
    }

    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class Bicycle: Printable {
    let type: String

    init(type: String) {
        self.type = type
    }

    func printDetails() -> String {
        return "I'm a \(type)"
    }
}



protocol Polygon {
    var area: Float { get }
}

class Rectangle: Polygon {

    private let width: Float
    private let length: Float

    init(width: Float, length: Float) {
        self.width = width
        self.length = length
    }

    var area: Float {
        return width * length
    }
}

class Square: Polygon {

    private let side: Float

    init(side: Float) {
        self.side = side
    }

    var area: Float {
        return pow(side, 2)
    }
}

// Client Method

func printArea(of polygon: Polygon) {
    print(polygon.area)
}


//
//  secondclassVC.swift
//  SolidPrinciple
//
//  Created by M1085568 on 22/07/22.
//

import UIKit

class secondclassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad2")

        // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear2")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear2")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews2")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear2")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear2")
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

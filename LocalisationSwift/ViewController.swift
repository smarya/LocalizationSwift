//
//  ViewController.swift
//  LocalisationSwift
//
//  Created by DurgaPrasad on 17/10/18.
//  Copyright © 2018 DurgaPrasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testBtnOutlet.localizedNormalTitleKey = Localizable.string("WeekDay.Saturday", comment: "Test String")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var testBtnOutlet: UIButton!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    @IBAction func LoginClick(_ sender: Any) {
     alertsController()
    }
    func alertsController() {
        let alertController = UIAlertController(title: Localizable.string("WeekDays", comment: "List of Days in a week"), message: Localizable.string("Week.Favourite.Day", comment: "Favourite Day"), preferredStyle: .actionSheet)
        
        let sunday = UIAlertAction(title: Localizable.string("WeekDay.Sunday", comment: "Sunday"), style: .default, handler: { (action) -> Void in
            print("Sunday button tapped")
        })
        let monday = UIAlertAction(title: Localizable.string("WeekDay.Monday", comment: "Monday"), style: .default, handler: { (action) -> Void in
            print("Monday button tapped")
        })
        let tuesday = UIAlertAction(title: Localizable.string("WeekDay.Tuesday", comment: "Tuesday"), style: .default, handler: { (action) -> Void in
            print("Tuesday button tapped")
        })
        let wednesday = UIAlertAction(title: Localizable.string("WeekDay.Wednesday", comment: "Wednesday"), style: .default, handler: { (action) -> Void in
            print("Wednesday button tapped")
        })
        let thursday = UIAlertAction(title: Localizable.string("WeekDay.Thursday", comment: "Thursday"), style: .default, handler: { (action) -> Void in
            print("Thursday button tapped")
        })
        let friday = UIAlertAction(title: Localizable.string("WeekDay.Friday", comment: "Friday"), style: .default, handler: { (action) -> Void in
            print("Friday button tapped")
        })
        let saturday = UIAlertAction(title: Localizable.string("WeekDay.Saturday", comment: "Saturday"), style: .default, handler: { (action) -> Void in
            print("Saturday button tapped")
        })
        
        
        alertController.addAction(sunday)
         alertController.addAction(monday)
         alertController.addAction(tuesday)
         alertController.addAction(wednesday)
         alertController.addAction(thursday)
         alertController.addAction(friday)
         alertController.addAction(saturday)
        present(alertController, animated: true) {
            print("alert Controller")
        }
    }

}


//
//  ViewController.swift
//  image Animation Timer
//
//  Created by dit03 on 2019. 3. 27..
//  Copyright © 2019년 201835867. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblCount: UILabel!

    var count = 1
    var dire = false
    var isAnimate = false
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Play(_ sender: Any) {
        if !isAnimate {
           isAnimate = true
            myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(doAnimate), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func Pause(_ sender: Any) {
        myTimer.invalidate()
        isAnimate = false
    }
    
    @IBAction func Stop(_ sender: Any) {
        if isAnimate {
            myTimer.invalidate()
            count = 0
            dire = false
            isAnimate = false
            imageView.image = UIImage(named: "Image\(count)")
            lblCount.text = String(count)
        }
    }
    
    @objc func doAnimate() {
        if dire == false {
            if count < 5 {
                count += 1
                if count == 5 {
                    dire = true
                }
            }
        } else {
            if count > 1 {
                count -= 1
                if count == 1 {
                    dire = false
                }
            }
        }
        imageView.image = UIImage(named: "Image\(count)")
        lblCount.text = String(count)
    }
    
}


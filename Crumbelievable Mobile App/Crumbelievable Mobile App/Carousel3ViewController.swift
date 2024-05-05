//
//  RewardsCarouselViewController.swift
//
//
//  Created by Zakary Amekran on 4/15/24.
//

import UIKit
import iCarousel

class Carousel3ViewController: UIViewController, iCarouselDataSource {

    //--MARK: ADD TIMER
    
    @IBOutlet var viewOne: UIView!
    @IBOutlet var viewTwo: UIView!
    @IBOutlet var viewThree: UIView!
    @IBOutlet var viewFour: UIView!
    @IBOutlet var viewFive: UIView!
    
    
    
    var myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 0, width: view.frame.size.width , height: view.frame.size.height)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 35, y: 130, width: 325, height: 300))
        var testView = UIView(frame: view.bounds)
        
        switch index{
            case 0:
                testView = viewOne
                break
            case 1:
                testView = viewTwo
                break
            case 2:
                testView = viewThree
                break
            case 3:
                testView = viewFour
                break
            case 4:
                testView = viewFive
                break
        default:
            print("Somethings wrong i can feel it")
        }
    
        view.addSubview(testView)
        
        return view
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

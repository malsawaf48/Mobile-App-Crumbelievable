//
//  ItalianViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 4/28/24.
//

import UIKit
protocol LanguageChangeDelegate: AnyObject {
    func didChangeLanguage()
}

class ItalianViewController: UIViewController {
    weak var delegate: LanguageChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func italianTime(_ sender: Any) {
        delegate?.didChangeLanguage()
        let newLanguage = (getCurrentLanguage() == "en") ? "it" : "en"
        
        UserDefaults.standard.set([newLanguage], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

       updateText()
    }
    func updateText()
    {
        
        
    }
    
    func getCurrentLanguage() -> String?{
        return (UserDefaults.standard.string(forKey: "AppleLanguages")?.components(separatedBy: "-").first)
    }
}

//
//  EditePasswordVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//


import UIKit
import Firebase

class EditePasswordVC: UIViewController  {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var passTF: CMTextField!
  @IBOutlet weak var sendBtn: UIButton!
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
      super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    sendBtn.cmShadow()
    self.dismissKeyboard()
  }
  
  
  // MARK: - Methods
  
  @IBAction func sendPressed(_ sender: Any) {
    Auth.auth().currentUser?.updatePassword(to: passTF.text!) { error in
      if error == nil{
        print("Sign Up Successful")
      }else{
        print("Error \(error?.localizedDescription)")
      }
    }
  }
}

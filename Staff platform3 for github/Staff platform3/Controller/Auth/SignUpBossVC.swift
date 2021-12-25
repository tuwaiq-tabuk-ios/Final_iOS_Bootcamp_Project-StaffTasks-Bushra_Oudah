//
//  ViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpBossVC: UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: MainTF!
  @IBOutlet weak var emailTF: MainTF!
  @IBOutlet weak var mobileTF: MainTF!
  @IBOutlet weak var idTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  
  @IBOutlet weak var SignUp: UIButton!
  
  @IBOutlet weak var Login: UIButton!
  
  let db = Firestore.firestore()
  var boos:Boos!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cornerRadios()
    shadow()
  }
  
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    Auth.auth().createUser(withEmail: emailTF.text!,
                           password: passwordTF.text!) { authResult, error in
      if error == nil{
        self.boos = Boos.init(name: self.nameTF.text!,                           phone: self.mobileTF.text!,
                     email: self.emailTF.text!,
                     id: self.idTF.text!)
        
        self.saveBoos(self.boos)
        print("Sign Up Successful")
      }else{
        print("Error \(error?.localizedDescription)")
      }
    }
  }
  
  
  func saveBoos(_ boos: Boos) {
    let docData: [String: Any] = [
      "name": boos.name,
      "email": boos.email,
      "phone": boos.phone,
      "id":boos.id,
      "userType":UserType.BOOS.rawValue
    ]
    
    db.collection("Users").document(Auth.auth().currentUser!.uid).setData(docData) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
}




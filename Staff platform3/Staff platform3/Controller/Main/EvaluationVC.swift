


import UIKit
import Firebase


class EvaluationVC: UIViewController{
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employee = [Employee]()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var tabelView: UITableView!
  
 
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readEvaluation()
    overrideUserInterfaceStyle = .light
    
  }
  
  // MARK: - Methods
  
  func readEvaluation(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          if let error = error {
            print(error.localizedDescription)
            return
          }
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          let evaluation = document.data()?["evaluation"] as? String
          print(evaluation)
          let emp  = Employee(name:nil,
                              email: nil,
                              phone: nil,
                              idNumber: nil,
                              task: nil,
                              evaluation: evaluation,
                              resignation: nil,
                              holiday: nil,active: nil,user:nil,zoomURL: nil)
          
          
          self.employee.append(emp)
          print("Document data")
          self.tabelView.reloadData()
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
    }
  }
}
  // MARK: - Table data source

  extension EvaluationVC: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employee.count
  }
  
  
}

// MARK: - Navigation

extension EvaluationVC: UITableViewDelegate {
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationCell") as! EvaluationCell
    cell.evaluationLabel.text = employee[indexPath.row].evaluation
    return cell
  }
}

//
//  EmployeeCell.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 21/05/1443 AH.
//

import UIKit

class EmployeeCell: UITableViewCell {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!

  // MARK: - View controller lifecycle
  
  override func awakeFromNib() {
      super.awakeFromNib()
 
  }


  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

  }

}
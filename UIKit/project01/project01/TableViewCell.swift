//
//  TableViewCell.swift
//  project01
//
//  Created by fernando babonoyaba on 6/22/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let id = "picture"
    
    let titleView: UILabel = {
        let title = UILabel()
        title.text = "this"
        return title
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(titleView)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTitle(title: String) {
        self.titleView.text = title
    }
}

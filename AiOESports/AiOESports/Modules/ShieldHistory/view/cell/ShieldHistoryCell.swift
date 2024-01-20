//
//  ShieldHistoryCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/01/2024.
//

import UIKit

class ShieldHistoryCell: UITableViewCell {
    
    @IBOutlet private(set) var dateTimeLabel: UILabel!
    @IBOutlet private(set) var descriptionLabel: UILabel!
    @IBOutlet private(set) var amountLabel: UILabel!
    @IBOutlet private(set) var detailsLabel: UILabel!
    
    lazy var renderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd MMM hh:mm"
        return formatter
    }()
    
    lazy var serverDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSSSSZ"
        return formatter
    }()
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var height: CGFloat {
        return 52.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func render(_ history: ShieldHistory) {
        dateTimeLabel.text = renderDateFormatter.string(from: serverDateFormatter.date(from: history.created_at) ?? Date())
        descriptionLabel.text = history.description
        amountLabel.text = String(history.amount)
        detailsLabel.text = history.detail
    }
    
    
}

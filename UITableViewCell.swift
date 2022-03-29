import UIKit

extension UILabel {
    class func createNew(textAlignment: NSTextAlignment = .left) ->UILabel{
        let label = UILabel()
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        return label
    }
}


class InvoiceCell: UITableViewCell {
    
    let label_id : UILabel = {
        return UILabel.createNew()
        }()
    
    let label_desc : UILabel = {
        return UILabel.createNew()
        }()
    
    let label_quantity : UILabel = {
        return UILabel.createNew(textAlignment: .right)
        }()
    
    let label_cost : UILabel = {
        return UILabel.createNew(textAlignment: .right)
        }()
    
    // Set up constraints for the label, only leadingAnchor and width multiplier
    private func setupConstraints(label: UILabel,
                                  leadingAnchor: NSLayoutXAxisAnchor ,
                                  width_multiplier: CGFloat = 0.2) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: width_multiplier).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label_id)
        addSubview(label_desc)
        addSubview(label_quantity)
        addSubview(label_cost)
        setupConstraints(label: label_id, leadingAnchor: self.leadingAnchor) // 20% of cell width
        setupConstraints(label: label_desc, leadingAnchor: label_id.trailingAnchor, width_multiplier: 0.4) // 40% 
        setupConstraints(label: label_quantity, leadingAnchor: label_desc.trailingAnchor) // 20% of cell width
        setupConstraints(label: label_cost, leadingAnchor: label_quantity.trailingAnchor) // 20% of cell width
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

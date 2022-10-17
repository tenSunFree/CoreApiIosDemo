import UIKit

class UsersTableViewCell: UITableViewCell {
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColorFromHex(rgbValue: 0x824CA7, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let lblName = UILabel()
        lblName.textColor = UIColorFromHex(rgbValue: 0xB9C406, alpha: 1.0)
        lblName.font = UIFont.boldSystemFont(ofSize: 17)
        lblName.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        return lblName
    }()
    
    internal lazy var imagesView : UIImageView = {
        let imageView2 = UIImageView()
        imageView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView2
    }()
    
    private lazy var statsView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imagesView, titleLabel])
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(statsView)
        self.setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupParametrs(items : UsersListResponse) {
        self.titleLabel.text = items.title
        let url = URL(string: items.images[0])!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imagesView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

extension UsersTableViewCell {
    private func setupAutoLayout() {
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        statsView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        statsView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
    }
}

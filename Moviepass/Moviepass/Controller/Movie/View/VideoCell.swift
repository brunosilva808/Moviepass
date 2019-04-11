import UIKit

class VideoCell: UITableViewCell, ModelPresenterCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    var model: Response.ComingSoon? {
        didSet {
            guard let model = self.model else { return }
            self.titleLabel.text = model.title
            self.thumbnailImageView?.image = UIImage()
            self.thumbnailImageView.loadImageUsingUrlString(urlString: model.imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
}

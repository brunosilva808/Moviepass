import UIKit

class CharacterCell: UITableViewCell, ModelPresenterCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            self.characterImageView.contentMode = .scaleAspectFill
        }
    }
    
    var model: Response.ComingSoon? {
        didSet {
            guard let model = self.model else { return }
            
            self.titleLabel.text = model.title
//            self.characterImageView.loadImageUsingUrlString(urlString: model.thumbnail.getImageUrl(size: .small))
        }
    }
    
}

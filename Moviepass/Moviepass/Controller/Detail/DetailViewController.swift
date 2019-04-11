import UIKit
import youtube_ios_player_helper_swift

class DetailViewController: UIViewController {

    var model: Response.ComingSoon!
    weak var delegate: PlayerDelegate?
    private var playerView: PlayerView = PlayerView.fromNib()
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var synopsisLabel: UILabel! {
        didSet {
            self.synopsisLabel.text = model.synopsis
        }
    }
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            self.imageView.loadImageUsingUrlString(urlString: self.model.imageURL)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.loadWebView()
    }
    
    func setupView() {
        self.title = self.model.title
    }
    
    func loadWebView() {
        if let youtubeId = model?.teaserVideoURL.components(separatedBy: "/").last {
            playerView.videoId = youtubeId
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addPlayerView()
    }
    
    private func addPlayerView(){
        let playerHeight: CGFloat = 240.0
        self.containerView.addSubview(playerView)
        
//        self.topImageConstraint.constant = 0
        playerView.frame = CGRect(x: 0, y: 0, width: self.containerView.bounds.width, height: playerHeight)
        playerView.delegate = self
        playerView.autoresizingMask = .flexibleWidth
    }

}

extension DetailViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}

extension DetailViewController: PlayerDelegate {

    func playerStateChanged(state: YTPlayerState) {
        if state == .playing {
            self.view.backgroundColor = .green
            self.delegate?.playerStateChanged(state: state)
        }
    }
}

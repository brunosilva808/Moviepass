import UIKit

class ViewController: UITableViewController {

    private let videosRequest = Request.Videos()
    private let networkManager = NetworkManager()
    private var movie: Response.Movie?
    private let titles = ["featured", "topBoxOffice", "newReleases", "comingSoon", "nowPlaying"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(for: VideoCell.self)
        
        self.networkManager.response(with: videosRequest, onSuccess: { [weak self] (response: Response.Movie) in
            
            self?.movie = response
        }, onError: { (error) in
            
        }) {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            return tableView.reusableCell(for: indexPath, with: (movie?.featured[indexPath.row])!) as VideoCell
        case 1:
            return tableView.reusableCell(for: indexPath, with: (movie?.topBoxOffice[indexPath.row])!) as VideoCell
        case 2:
            return tableView.reusableCell(for: indexPath, with: (movie?.newReleases[indexPath.row])!) as VideoCell
        case 3:
            return tableView.reusableCell(for: indexPath, with: (movie?.comingSoon[indexPath.row])!) as VideoCell
        case 4:
            return tableView.reusableCell(for: indexPath, with: (movie?.nowPlaying[indexPath.row])!) as VideoCell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return movie?.featured.count ?? 0
        case 1:
            return movie?.topBoxOffice.count ?? 0
        case 2:
            return movie?.newReleases.count ?? 0
        case 3:
            return movie?.comingSoon.count ?? 0
        case 4:
            return movie?.nowPlaying.count ?? 0
        default:
            return 0
        }
    }
}

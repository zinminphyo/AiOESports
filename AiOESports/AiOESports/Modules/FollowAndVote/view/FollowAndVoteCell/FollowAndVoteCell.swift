//
//  FollowAndVoteCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Kingfisher

class FollowAndVoteCell: UITableViewCell {
    
    struct FollowAndVoteRenderer {
        let imageURL: String?
        var count: Int? = nil
        
        init(forTeam: FollowAndVoteTeam) {
            imageURL = "\(NetworkBaseURLs.shared.baseURL)/\(forTeam.team_image)"
        }
        
        init(forTalent: FollowAndVoteTalent) {
            imageURL = "\(NetworkBaseURLs.shared.baseURL)/\(forTalent.player_image)"
        }

    }
    
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var firstTeamRenderer: UIView!
    @IBOutlet private(set) var firstTeamImageView: UIImageView!
    @IBOutlet private(set) var secondTeamRenderer: UIView!
    @IBOutlet private(set) var secondTeamImageView: UIImageView!
    @IBOutlet private(set) var remainingTeamCountRenderer: UIView!
    @IBOutlet private(set) var remainingTeamCountLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
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
    
    func render(list: [FollowAndVoteTeam]) {
        guard list.count > 0 else { return }
        let renderers = list.compactMap{ FollowAndVoteRenderer(forTeam: $0) }
        firstTeamRenderer.isHidden = renderers.count < 1
        secondTeamRenderer.isHidden = renderers.count < 2
        remainingTeamCountRenderer.isHidden = renderers.count < 3
        switch renderers.count {
        case 1:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
        case 2:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
            secondTeamImageView.kf.setImage(with: URL(string: renderers[1].imageURL ?? ""))
        case 3...:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
            secondTeamImageView.kf.setImage(with: URL(string: renderers[1].imageURL ?? ""))
            remainingTeamCountLabel.text = "+\(renderers.count - 2)"
        default:
            break
        }
    }
    
    func render(talentLists: [FollowAndVoteTalent]) {
        guard talentLists.count > 0 else { return }
        let renderers = talentLists.compactMap{ FollowAndVoteRenderer(forTalent: $0) }
        firstTeamRenderer.isHidden = renderers.count < 1
        secondTeamRenderer.isHidden = renderers.count < 2
        remainingTeamCountRenderer.isHidden = renderers.count < 3
        switch renderers.count {
        case 1:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
        case 2:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
            secondTeamImageView.kf.setImage(with: URL(string: renderers[1].imageURL ?? ""))
        case 3...:
            firstTeamImageView.kf.setImage(with: URL(string: renderers[0].imageURL ?? ""))
            secondTeamImageView.kf.setImage(with: URL(string: renderers[1].imageURL ?? ""))
            remainingTeamCountLabel.text = "+\(renderers.count - 2)"
        default:
            break
        }
    }
    
    
    func render(title: String) {
        titleLabel.text = title
    }
}

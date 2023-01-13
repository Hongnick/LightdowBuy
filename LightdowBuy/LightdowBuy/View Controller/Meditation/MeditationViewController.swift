//
//  MeditationViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2022/11/3.
//

import UIKit
import AVKit
import AVFoundation
import SnapKit
import youtube_ios_player_helper
import SafariServices

class MeditationViewController: BaseViewController, SFSafariViewControllerDelegate {

    
//    let musicVideoView: UIView = {
//        let musicVideo = UIView()
//        return musicVideo
//    }()
    
//    var videoPlayer: AVPlayer!
//    var avplayerVC = AVPlayerViewController()
    
    
    var oneMusicPlayer: YTPlayerView!
    var twoMusicPlayer: YTPlayerView!
    var meditationContentView: UITextView!
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    let meditationTitleImage: UIImageView = {
        let meditationTitleImage = UIImageView()
        meditationTitleImage.image = AppImage.image(image: .longMark)
        meditationTitleImage.contentMode = .scaleAspectFit
        meditationTitleImage.translatesAutoresizingMaskIntoConstraints = false
        meditationTitleImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        meditationTitleImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return meditationTitleImage
    }()
    
    
    /* 冥想音樂 */
    let meditationMusicTitle: UILabel = {
        let meditationMusicTitle = UILabel()
        meditationMusicTitle.font = UIFont.boldSystemFont(ofSize: 20)
        meditationMusicTitle.text = "冥想音樂"
        meditationMusicTitle.textColor = UIColor.gray
        
        return meditationMusicTitle
    }()
    
    let meditationTitleContainerView: UIStackView = {
        let meditationTitleContainerView = UIStackView()
        meditationTitleContainerView.axis = .horizontal
        meditationTitleContainerView.distribution = .fillProportionally
        meditationTitleContainerView.translatesAutoresizingMaskIntoConstraints = false
        meditationTitleContainerView.spacing = 5
        return meditationTitleContainerView
    }()
    
    let lineView : UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#26000000")
        return lineView
    }()
    
    var moreMusicLinkLabel: UILabel!
    let moreMusicLinkText = "更多冥想音樂或輕音樂，請點 Lian Shuo"
    let youtubeName = "Lian Shuo"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMethod()
        
        
      
        
        
//        let url = URL(string: "https://www.youtube.com/watch?v=BxjWPwzqngI")
//        videoPlayer = AVPlayer(url: url!)
//        avplayerVC.player = videoPlayer
//        avplayerVC.view.frame.size.height = musicVideoView.frame.size.height
//        avplayerVC.view.frame.size.width = musicVideoView.frame.size.width
//        self.musicVideoView.addSubview(avplayerVC.view)
        
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.scrollView.contentSize = self.contentView.frame.size
        }
    }
    
    
}


extension MeditationViewController: SetupProtocol {
    
    func initMethod() {
        setupUI()
        setupLayout()
        
    }
    
    func setupUI() {
        //view.addSubview(musicVideoView)
        
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        
        oneMusicPlayer = YTPlayerView()
        oneMusicPlayer.load(withVideoId: "BxjWPwzqngI")
        contentView.addSubview(oneMusicPlayer)
        
        
        twoMusicPlayer = YTPlayerView()
        twoMusicPlayer.load(withVideoId: "67GEzdkfUb4")
        contentView.addSubview(twoMusicPlayer)
        
        contentView.addSubview(lineView)
      
        
        meditationContentView = UITextView()
        meditationContentView.font = UIFont.systemFont(ofSize: 16)
        meditationContentView.text = "現代人壓力大，不管在家庭上、工作上、各種煩擾的事情上，往往造成情緒不佳，透過音樂冥想靜靜的平緩沉澱內心緊張不安的思緒，清除雜念，可有助於鍛鍊專注力、舒緩緊繃的神經與肌肉，減輕憂鬱…等，此提供一個youtube頻道，開始播放音樂，紓解壓力吧～～！。"
        meditationContentView.textColor = UIColor(hexString: "#588410")
        meditationContentView.isEditable = false
        meditationContentView.backgroundColor = .clear
        meditationContentView.isScrollEnabled = false
        contentView.addSubview(meditationContentView)
       
        
        
        contentView.addSubview(meditationTitleContainerView)
        meditationTitleContainerView.addArrangedSubview(meditationTitleImage)
        meditationTitleContainerView.addArrangedSubview(meditationMusicTitle)
        
        moreMusicLinkLabel = UILabel()
        
        let formattedText = String.format(strings: [youtubeName],keywordFont: UIFont.boldSystemFont(ofSize: 16), keywordColor: UIColor.blue, inString: moreMusicLinkText, font: UIFont.boldSystemFont(ofSize: 16),color: UIColor.black)
        
        moreMusicLinkLabel.attributedText = formattedText
        moreMusicLinkLabel.numberOfLines = 0
        moreMusicLinkLabel.textAlignment = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleMoreMusicTextTapped))
        moreMusicLinkLabel.addGestureRecognizer(tap)
        moreMusicLinkLabel.isUserInteractionEnabled = true
        
        contentView.addSubview(moreMusicLinkLabel)
        
        
    }
    
    func setupLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view)
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView)
        }
        
        meditationTitleContainerView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(10)
            $0.leading.greaterThanOrEqualTo(contentView).offset(10)
            $0.height.equalTo(30)
            
        }
        
        meditationContentView.snp.makeConstraints {
            $0.top.equalTo(meditationTitleContainerView.snp.bottom).offset(10)
            $0.leading.equalTo(contentView).offset(10)
            $0.trailing.equalTo(contentView).offset(-10)
        }
        
        lineView.snp.makeConstraints {

            $0.top.equalTo(meditationContentView.snp.bottom).offset(10)
            $0.trailing.leading.equalTo(contentView).offset(10)
            $0.height.equalTo(1)
        }
        
        
        oneMusicPlayer.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(20)
            $0.leading.equalTo(contentView).offset(10)
            $0.trailing.equalTo(contentView).offset(-10)
            $0.height.equalTo(300)
        }
        
        twoMusicPlayer.snp.makeConstraints {
            $0.top.equalTo(oneMusicPlayer.snp.bottom).offset(20)
            $0.leading.equalTo(contentView).offset(10)
            $0.trailing.equalTo(contentView).offset(-10)
           // $0.bottom.equalTo(contentView).offset(-16)
            $0.height.equalTo(300)
        }
        
        moreMusicLinkLabel.snp.makeConstraints {
            $0.top.equalTo(twoMusicPlayer.snp.bottom).offset(30)
            $0.leading.equalTo(contentView).offset(10)
            $0.trailing.equalTo(contentView).offset(-10)
            $0.bottom.equalTo(contentView).offset(-50)
            
        }
        
    }
    
    
    @objc func handleMoreMusicTextTapped(gesture:UITapGestureRecognizer) {
        let textString = moreMusicLinkText as NSString
        let textRange = textString.range(of: youtubeName)
        
        let tapLocation = gesture.location(in: moreMusicLinkLabel)
        let index = moreMusicLinkLabel.indexOfAttributedTextCharacterAtPoint(point: tapLocation)
        
        if checkRange(textRange, contain: index) == true {
            moreMusicLinkAction()
            return
        }
    }
    
    func checkRange(_ range: NSRange, contain index: Int) -> Bool {
        return index > range.location && index < range.location + range.length
    }
    
    @objc func moreMusicLinkAction() {
        
        let urlString = "https://www.youtube.com/channel/UCVW8I-Do2I4OzrBbUDQCJsQ"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let openurl = URL(string: encoded) {
            
            let moreMusicVC = SFSafariViewController(url: openurl)
            
            moreMusicVC.dismissButtonStyle = .close
            moreMusicVC.delegate = self
            self.present(moreMusicVC, animated: true, completion: nil)
        }
        
    }
    
}

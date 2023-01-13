//
//  HomePageViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/20.
//

import UIKit
import Firebase
import SnapKit
import youtube_ios_player_helper
import SafariServices

class HomePageViewController: BaseViewController,UIScrollViewDelegate, SFSafariViewControllerDelegate {
    
    /* 首頁第一區塊 「理念」 */
    let ideaBackGroundView: UIView = {
        let homepageView = UIView()
        homepageView.backgroundColor = UIColor(hexString: "CFD9DF")
        return homepageView
    }()
    
    
    let ideaTextView: UITextView = {
        let ideaTextView = UITextView()
        ideaTextView.font = UIFont.systemFont(ofSize: 16)
        ideaTextView.text = "\n現代人的生活壓力\n社會世代的急速變遷\n在我們重視身體健康的同時\n是否也有看重心靈的健康\n面對生命精彩的光後\n轉面看著身後的影\n接納他\n包容他\n開始一段平衡的旅程"
        ideaTextView.textColor = .black
        ideaTextView.textAlignment = .center
       // ideaTextView.backgroundColor = UIColor(hexString: "DFD19D")
        ideaTextView.isUserInteractionEnabled = false
       
        ideaTextView.layer.borderColor = UIColor(hexString: "7F8145").cgColor
        ideaTextView.layer.borderWidth = 2
        ideaTextView.layer.cornerRadius = 10
        
        return ideaTextView
    }()
    
    var lightImageView: UIImageView = {
        let lightImageView = UIImageView()
        lightImageView.contentMode = .scaleAspectFill
        lightImageView.image = UIImage(named: "light")
        lightImageView.alpha = 0.2
        return lightImageView
    }()
    
    
    
    /* 首頁第二區塊 「功能」 */
    
    let functionView: UIView = {
        let functionView = UIView()
        functionView.backgroundColor = UIColor(hexString: "C38589")
        functionView.backgroundColor = #colorLiteral(red: 0.325171326, green: 0.3666850942, blue: 0.5, alpha: 0.6992623466)
        
        return functionView
        
    }()
    
    
    let functionContainerView: UIStackView = {
        let functionContainerView = UIStackView()
        functionContainerView.axis = .horizontal
        functionContainerView.distribution = .fillProportionally
        functionContainerView.translatesAutoresizingMaskIntoConstraints = false
        functionContainerView.spacing = 6
        return functionContainerView
    }()
    
    
    let personalBlog: UIButton = {
        // 客製化Button 「上圖下字」
        var configuration = UIButton.Configuration.filled()
        var title = AttributedString("個人網誌")
        title.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        configuration.attributedTitle = title
        configuration.image = UIImage(named: "blogIcon80")
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .top
        configuration.background.backgroundColor = .clear
        let action = UIAction { action in
            print("personalBlog Button tap")
        }
        
        let personalBlog = UIButton(configuration: configuration, primaryAction: action)
        
        personalBlog.addTarget(self, action: #selector(personBlogLinkAction), for: .touchUpInside)
        return personalBlog
    }()
    
    
    

    let meditationMusic: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var title = AttributedString("冥想音樂")
        title.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        configuration.attributedTitle = title
        configuration.image = UIImage(named: "videoPlayer80")
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .top
        configuration.background.backgroundColor = .clear
        let action = UIAction { action in
            print("meditationMusic Button tap")
            
        }
        
        let meditationMusic = UIButton(configuration: configuration, primaryAction: action)
   
        meditationMusic.addTarget(self, action: #selector(functionMusicBtnAction), for: .touchUpInside)
        return meditationMusic
    }()
    
    
    
    let psychologyInfo: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var title = AttributedString("心理學")
        title.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        configuration.attributedTitle = title
        configuration.image = UIImage(named: "brainMind80")
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .top
        configuration.background.backgroundColor = .clear
        let action = UIAction { action in
            print("psychologyInfo button tap")
            
        }
        let psychologyInfo = UIButton(configuration: configuration, primaryAction: action)
     
        return psychologyInfo
    }()
    
    
    let QRCodeAction: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var title = AttributedString("QRCode")
        title.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        configuration.attributedTitle = title
        configuration.image = UIImage(named: "QRCodescan80")
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .top
        configuration.background.backgroundColor = .clear
        let action = UIAction { action in
            print("button tap")
            
        }
        let QRCodeAction = UIButton(configuration: configuration, primaryAction: action)
        
        QRCodeAction.addTarget(self, action: #selector(QRcodeAction), for: .touchUpInside)
        return QRCodeAction
    }()
    
    

    /* 首頁第二區塊 「畫作展示」 */
    
    lazy var artShowTableView: UITableView = {
        let artShowTableView = UITableView()
        artShowTableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        artShowTableView.isScrollEnabled = false
        artShowTableView.dataSource = self
        artShowTableView.delegate = self
        
        return artShowTableView
        
    }()
    
    
    /* banner 輪播 */
    
    let width = UIScreen.main.bounds.size.width
    var currentIndex : NSInteger = 0
    var leftImageView = UIImageView()
    var rightImageView = UIImageView()
    var currentImageView = UIImageView()
    var imageArray = [String]()
    var timer = Timer()
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var contentTextView: UITextView!
    var cardContentTextView: UITextView!
    
    
    
    /* 上方banner */
    lazy var bannerScrollView: UIScrollView = {
        let bannerScrollView = UIScrollView()
        bannerScrollView.contentSize = CGSize(width: width * 3, height: 150)
        bannerScrollView.contentOffset = CGPoint(x: width, y: 663)
        bannerScrollView.isPagingEnabled = true
        bannerScrollView.frame = CGRect(x: 0, y: 663, width: width, height: 150)
        rightImageView.frame = CGRect(x: width * 2, y: 663, width: width, height: 150)
        currentImageView.frame = CGRect(x: width * 1, y: 663, width: width, height: 150)
        leftImageView.frame = CGRect(x: width * 0, y: 663, width: width, height: 150)
        bannerScrollView.addSubview(rightImageView)
        bannerScrollView.addSubview(currentImageView)
        bannerScrollView.addSubview(leftImageView)
        bannerScrollView.delegate = self
        bannerScrollView.isUserInteractionEnabled = false
        return bannerScrollView
    }()

    /* 下方小圓點 */
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: bannerScrollView.frame.maxY-20, width: width, height: 20)
        pageControl.backgroundColor = UIColor.clear
        //小圓點選取時顏色
        pageControl.currentPageIndicatorTintColor = UIColor.init(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //小圓點未選取顏色
        pageControl.pageIndicatorTintColor = UIColor.init(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2)
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        return pageControl
    }()
    
    
   
   /* viewModels 畫作展示資料 */
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Apple", image: UIImage(named: "art01")!, backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Google", image: UIImage(named: "art02")!, backgroundColor: .systemRed),
                TileCollectionViewCellViewModel(name: "Nvidia", image: UIImage(named: "art03")!, backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Intel", image: UIImage(named: "art04")!, backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Facebook", image: UIImage(named: "art05")!, backgroundColor: .systemGreen),
                TileCollectionViewCellViewModel(name: "Microsoft", image:  UIImage(named: "art06")!, backgroundColor: .systemOrange),
               
            ]
        )
    ]

  
    func logoNavgationBarButtonItem() {
        
        
        var configuration = UIButton.Configuration.filled()
        var title = AttributedString("光影藝術治療")
        title.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        configuration.attributedTitle = title
        configuration.image = AppImage.image(image: .lightdowBuyLogo)
        configuration.baseForegroundColor = .black
        configuration.imagePlacement = .leading
        configuration.background.backgroundColor = .clear
        let action = UIAction { action in
            print("personalBlog Button tap")
        }
    
        
        let logoButton = UIButton(configuration: configuration, primaryAction: action)
        
        logoButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        logoButton.setImage(UIImage(named: "LightdowBuylogo44"), for: .normal)
        let leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
      

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        initMethod()
        logoNavgationBarButtonItem()
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "D0CAE2")
        
        view.backgroundColor = .white
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.scrollView.contentSize = self.contentView.frame.size
        }
    }

 

}



extension HomePageViewController: SetupProtocol {
    
    func initMethod() {
        imageArray = ["heartlong","cardImg","drawImg"]
        reloadImage()
        setupTimer()
        
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        
        
        view.addSubview(bannerScrollView)
        view.addSubview(pageControl)
        
        
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView = UIView()
      
        scrollView.addSubview(contentView)
        

        
        contentView.addSubview(ideaBackGroundView)
        ideaBackGroundView.addSubview(ideaTextView)
        ideaBackGroundView.addSubview(lightImageView)
        
        
        contentView.addSubview(functionView)
        
        functionView.addSubview(functionContainerView)
        functionContainerView.addArrangedSubview(personalBlog)
        functionContainerView.addArrangedSubview(meditationMusic)
        functionContainerView.addArrangedSubview(psychologyInfo)
        functionContainerView.addArrangedSubview(QRCodeAction)
            //functionContainerView.addArrangedSubview(lessonInfo)
       
        
        contentView.addSubview(artShowTableView)
        
        
        contentTextView = UITextView()
        contentTextView.font = UIFont.systemFont(ofSize: 16)
        contentTextView.text = ""
        contentTextView.isEditable = false
        contentTextView.isSelectable = true
        contentTextView.dataDetectorTypes = .link
        contentTextView.isScrollEnabled = false
        contentView.addSubview(contentTextView)
        
        cardContentTextView = UITextView()
        cardContentTextView.font = UIFont.systemFont(ofSize: 14)
        cardContentTextView.text = ""
        cardContentTextView.textColor = UIColor.black
        cardContentTextView.isEditable = false
        cardContentTextView.backgroundColor = .clear
        cardContentTextView.isScrollEnabled = false
        contentView.addSubview(cardContentTextView)
        
        
 
        
        
    }
    
    func setupLayout() {
        let padding = 16.0

        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-150)
        }

        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView)
        }
        
        ideaBackGroundView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView)
            $0.height.equalTo(300)
        }
        
        ideaTextView.snp.makeConstraints {
            $0.top.equalTo(ideaBackGroundView).offset(20)
            $0.trailing.equalTo(ideaBackGroundView).offset(-20)
            $0.bottom.equalTo(ideaBackGroundView).offset(-20)
            $0.width.equalTo(220)
        }
        
        lightImageView.snp.makeConstraints {
            $0.top.equalTo(ideaBackGroundView)
            $0.leading.equalTo(ideaBackGroundView).offset(90)
            $0.bottom.equalTo(ideaBackGroundView)
         
        }
        
        functionView.snp.makeConstraints {
            $0.top.equalTo(ideaBackGroundView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView)
            $0.height.equalTo(120)
        }
        
        
        functionContainerView.snp.makeConstraints {
            $0.top.equalTo(functionView).offset(25)
            $0.leading.greaterThanOrEqualTo(functionView)
            $0.trailing.equalTo(functionView).offset(-25)
            $0.height.equalTo(60)
        }
        
        
        
        artShowTableView.snp.makeConstraints { 
            $0.top.equalTo(functionView.snp.bottom).offset(20)
            $0.leading.equalTo(contentView).offset(10)
            $0.trailing.equalTo(contentView).offset(-10)
            $0.height.equalTo(400)
        }
        
        
     
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(artShowTableView.snp.bottom).offset(10)
            $0.leading.equalTo(contentView).offset(padding)
            $0.trailing.equalTo(contentView).offset(-padding)
            //$0.bottom.equalTo(chakraView).offset(-padding)
        }
        
        
        
        
        cardContentTextView.snp.makeConstraints {
            $0.top.equalTo(contentTextView.snp.bottom).offset(padding)
            $0.leading.equalTo(contentView).offset(padding)
            $0.trailing.equalTo(contentView).offset(-padding)
            $0.bottom.equalTo(contentView).offset(-padding)
        }
        
    }
    
    
 
   /*-- 更新圖片 --*/
       func reloadImage(){
           var leftIndex = 0
           var rightIndex = 0
           // 利用餘數 % 取得當前位置
           currentIndex = currentIndex % imageArray.count
           bannerScrollView.setContentOffset(CGPoint(x: width, y: 663), animated: false)
           pageControl.currentPage = (currentIndex - 1 + imageArray.count) % imageArray.count
           //防止越界
           leftIndex = (currentIndex - 1 + imageArray.count) % imageArray.count
           rightIndex = (currentIndex + 1) % imageArray.count
           rightImageView.image = UIImage(named: imageArray[rightIndex])
           currentImageView.image = UIImage(named: imageArray[currentIndex])
           leftImageView.image = UIImage(named: imageArray[leftIndex])

       }
    
      /*-- 更新timer --*/
    
       func setupTimer() {
           timer = Timer.scheduledTimer(timeInterval: 2,target:self,selector:#selector(timeChanged),userInfo:nil,repeats:true)
           RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
       }
      /*-- time 事件 --*/
    
       @objc func timeChanged(){
           currentIndex = currentIndex + 1
           //更新圖片+scrollView
           reloadImage()
       }
     /*-- scrollView 滑動開始監聽 --*/
    
       func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
           timer.invalidate()
       }
    
     /*-- scrollView 滑動坄停止監聽 --*/
    
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

           //向右拖動
           if scrollView.contentOffset.x > width {
               currentIndex = (currentIndex + 1) % imageArray.count
           }

           //向左拖動
           if scrollView.contentOffset.x < width{
               currentIndex = (currentIndex - 1 + imageArray.count) % imageArray.count
           }
   
           //更新小圓點當前位置
           pageControl.currentPage = (currentIndex - 1 + imageArray.count) % imageArray.count
           reloadImage()
           setupTimer()
       }

       
    
    
    @objc func personBlogLinkAction() {
        
        let urlString = "https://vockla.com/"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let openurl = URL(string: encoded) {
            
            let personBlogVC = SFSafariViewController(url: openurl)
            
            personBlogVC.dismissButtonStyle = .close
            personBlogVC.delegate = self
            self.present(personBlogVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    @objc func functionMusicBtnAction() {
        let vc = MeditationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func QRcodeAction() {
        let vc = ScannerViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
      
    
}


extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = CGFloat()
        height = 400
        return height
    }


}


extension HomePageViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "You successfully got the selected item!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    
    
}

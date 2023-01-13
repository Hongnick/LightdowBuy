//
//  ServiceViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/30.
//

import UIKit
import SnapKit

class ServiceViewController: BaseViewController {
    

    var scrollView: UIScrollView!
    var contentView: UIView!
    var chakraContentTextView: UITextView!
    var cardContentTextView: UITextView!
    var drawContentTextView: UITextView!
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = AppImage.image(image: .lightdowBuyLogo)
        logoImage.contentMode =  .scaleAspectFit
        return logoImage
    }()
    
    
    let appLabel: UILabel = {
        let appLabel = UILabel()
        appLabel.font = UIFont.boldSystemFont(ofSize: 20)
        appLabel.text = "光影藝術治療"
        appLabel.textColor = UIColor.black
        appLabel.textAlignment = .center
        return appLabel
    }()
    
    let serviceTitleImage: UIImageView = {
        let serviceTitleImage = UIImageView()
        serviceTitleImage.image = AppImage.image(image: .longMark)
        serviceTitleImage.contentMode = .scaleAspectFit
        serviceTitleImage.translatesAutoresizingMaskIntoConstraints = false
        serviceTitleImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        serviceTitleImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return serviceTitleImage
    }()
  
    

    /* 服務項目 */
//    let serviceItemTitle: UILabel = {
//        let serviceItemTitle = UILabel()
//        serviceItemTitle.font = UIFont.boldSystemFont(ofSize: 20)
//        serviceItemTitle.text = "服務項目"
//        serviceItemTitle.textColor = UIColor.gray
//
//        return serviceItemTitle
//    }()
//
//    let serviceTitleContainerView: UIStackView = {
//        let serviceTitleContainerView = UIStackView()
//        serviceTitleContainerView.axis = .horizontal
//        serviceTitleContainerView.distribution = .fillProportionally
//        serviceTitleContainerView.translatesAutoresizingMaskIntoConstraints = false
//        serviceTitleContainerView.spacing = 5
//        return serviceTitleContainerView
//    }()
//
    
    /* 脈輪測試 */
    let chakraTestTitle: UILabel = {
        let chakraTestTitle = UILabel()
        chakraTestTitle.font = UIFont.boldSystemFont(ofSize: 16)
        chakraTestTitle.text = "脈輪測試"
        chakraTestTitle.textColor = UIColor(hexString: "#588410")
        
        return chakraTestTitle
    }()
    
    
    let chakraView: UIView = {
        let chakraView = UIView()
        chakraView.backgroundColor = UIColor(hexString: "#CFD9DF")
        
        return chakraView
    }()
    
    let heartlongImage: UIImageView = {
        let heartlongImage = UIImageView()
        heartlongImage.image = AppImage.image(image: .heartlong)
        heartlongImage.contentMode = .scaleAspectFill
        return heartlongImage
    }()
    
    
    /* 占卜雷諾曼卡 */
    let cardTestTitle: UILabel = {
        let cardTestTitle = UILabel()
        cardTestTitle.font = UIFont.boldSystemFont(ofSize: 16)
        cardTestTitle.text = "占卜雷諾曼卡"
        cardTestTitle.textColor = UIColor(hexString: "#588410")
        
        return cardTestTitle
    }()
    
    
    let cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = UIColor.white
        
        return cardView
    }()
    
    let cardlongImage: UIImageView = {
        let cardlongImage = UIImageView()
        cardlongImage.image = AppImage.image(image: .cardImg)
        cardlongImage.contentMode = .scaleAspectFill
        return cardlongImage
    }()
    
    
    /* 個案解畫 */
    let drawTestTitle: UILabel = {
        let drawTestTitle = UILabel()
        drawTestTitle.font = UIFont.boldSystemFont(ofSize: 16)
        drawTestTitle.text = "個案解畫"
        drawTestTitle.textColor = UIColor(hexString: "#588410")
        
        return drawTestTitle
    }()
    
    
    let drawView: UIView = {
        let drawView = UIView()
        drawView.backgroundColor = UIColor(hexString: "#CFD9DF")
        
        return drawView
    }()
    
    let drawlongImage: UIImageView = {
        let drawlongImage = UIImageView()
        drawlongImage.image = AppImage.image(image: .drawImg)
        drawlongImage.contentMode = .scaleAspectFill
        return drawlongImage
    }()
    
    
    func logoNavgationBarButtonItem() {
        
        
        var leftConfiguration = UIButton.Configuration.filled()
        var leftTitle = AttributedString("光影藝術治療")
        leftTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        leftConfiguration.attributedTitle = leftTitle
        leftConfiguration.image = AppImage.image(image: .lightdowBuyLogo)
        leftConfiguration.baseForegroundColor = .black
        leftConfiguration.imagePlacement = .leading
        leftConfiguration.background.backgroundColor = .clear
        let leftAction = UIAction { action in
            print("leftConfiguration Button tap")
        }
    
        
        let logoButton = UIButton(configuration: leftConfiguration, primaryAction: leftAction)
        
        logoButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        logoButton.setImage(UIImage(named: "LightdowBuylogo44"), for: .normal)
        let leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        
        
        
        var rightConfiguration = UIButton.Configuration.filled()
        var rightTitle = AttributedString("服務項目")
        rightTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        rightConfiguration.attributedTitle = rightTitle
        rightConfiguration.baseForegroundColor = .brown
        rightConfiguration.background.backgroundColor = .clear
        let rightAction = UIAction { action in
            print("rightConfiguration Button tap")
        }
        
        let rightButton = UIButton(configuration: rightConfiguration, primaryAction: rightAction)
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
       
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
       
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem

    }
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "服務項目"
        
        initMethod()
        logoNavgationBarButtonItem()
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "D0CAE2")
  
       
        navigationController?.view.backgroundColor = UIColor(hexString: "D0CAE2")
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.scrollView.contentSize = self.contentView.frame.size
        }
    }
   

}

extension ServiceViewController: SetupProtocol {
    
    func initMethod() {
        setupUI()
        setupLayout()
    
    }
    
    
    func setupUI() {
    
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        
        contentView.addSubview(chakraView)
//        chakraView.addSubview(logoImage)
//        chakraView.addSubview(appLabel)
//        chakraView.addSubview(serviceTitleContainerView)
//        serviceTitleContainerView.addArrangedSubview(serviceTitleImage)
//        serviceTitleContainerView.addArrangedSubview(serviceItemTitle)
        
        chakraView.addSubview(chakraTestTitle)
        
        chakraContentTextView = UITextView()
        chakraContentTextView.font = UIFont.systemFont(ofSize: 14)
        chakraContentTextView.text = "流傳於古印度「神秘學」，最早概念出現在「吠陀經Vedas」，廣泛用於古代醫術中，如：中醫「氣派」、「穴位」、「經絡」，一種氣的流動，轉換成「能量」"
        chakraContentTextView.textColor = UIColor.black
        chakraContentTextView.isEditable = false
        chakraContentTextView.backgroundColor = .clear
        chakraContentTextView.isScrollEnabled = false
        chakraView.addSubview(chakraContentTextView)
        chakraView.addSubview(heartlongImage)
        
        
        
        contentView.addSubview(cardView)
        cardView.addSubview(cardTestTitle)
        
        cardContentTextView = UITextView()
        cardContentTextView.font = UIFont.systemFont(ofSize: 14)
        cardContentTextView.text = "雷諾曼卡是一套三十六張牌卡組成的占卜工具，盛行於十九世紀末歐洲的名流沙龍聚會"
        cardContentTextView.textColor = UIColor.black
        cardContentTextView.isEditable = false
        cardContentTextView.backgroundColor = .clear
        cardContentTextView.isScrollEnabled = false
        cardView.addSubview(cardContentTextView)
        cardView.addSubview(cardlongImage)
        
        
        contentView.addSubview(drawView)
        drawView.addSubview(drawTestTitle)
        
        drawContentTextView = UITextView()
        drawContentTextView.font = UIFont.systemFont(ofSize: 14)
        drawContentTextView.text = "藉由繪畫的過程，了解自己所忽略的內在情緒，跟著畫作一起釋放內在壓力，放手展望。"
        drawContentTextView.textColor = UIColor.black
        drawContentTextView.isEditable = false
        drawContentTextView.backgroundColor = .clear
        drawContentTextView.isScrollEnabled = false
        drawView.addSubview(drawContentTextView)
        drawView.addSubview(drawlongImage)
        
        
    
        
    }
    
    func setupLayout() {
      
   
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view)
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView)
        }
        
        
        chakraView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView)
        }
        
        
        
//        logoImage.snp.makeConstraints {
//            $0.top.equalTo(chakraView).offset(10)
//            $0.leading.equalTo(chakraView).offset(20)
//            $0.height.equalTo(50)
//            $0.width.equalTo(50)
//
//        }
//
//        appLabel.snp.makeConstraints {
//            $0.top.equalTo(chakraView)
//            $0.leading.equalTo(logoImage.snp.trailing).offset(10)
//            $0.centerY.equalTo(logoImage)
//        }
        
//        serviceTitleContainerView.snp.makeConstraints {
//            $0.top.equalTo(appLabel.snp.bottom).offset(20)
//            $0.leading.greaterThanOrEqualTo(chakraView).offset(30)
//            $0.height.equalTo(30)
//        }
        
        
        chakraTestTitle.snp.makeConstraints {
            $0.top.equalTo(chakraView).offset(20)
            $0.leading.equalTo(chakraView).offset(50)
        }
        
        chakraContentTextView.snp.makeConstraints {
            $0.top.equalTo(chakraTestTitle.snp.bottom).offset(10)
            $0.leading.equalTo(chakraView).offset(50)
            $0.trailing.equalTo(chakraView).offset(-30)
        }
        
        heartlongImage.snp.makeConstraints {
            $0.top.equalTo(chakraContentTextView.snp.bottom).offset(50)
            $0.leading.equalTo(chakraView).offset(50)
            $0.trailing.equalTo(chakraView).offset(-50)
            $0.bottom.equalTo(chakraView).offset(-50)
        }
        
        
        cardView.snp.makeConstraints {
            $0.top.equalTo(chakraView.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
           // $0.bottom.equalTo(contentView)
        }
////
        cardTestTitle.snp.makeConstraints {
            $0.top.equalTo(cardView).offset(20)
            $0.leading.equalTo(cardView).offset(50)
        }

        cardContentTextView.snp.makeConstraints {
            $0.top.equalTo(cardTestTitle.snp.bottom).offset(10)
            $0.leading.equalTo(cardView).offset(50)
            $0.trailing.equalTo(cardView).offset(-30)
        }

        cardlongImage.snp.makeConstraints {
            $0.top.equalTo(cardContentTextView.snp.bottom).offset(10)
            $0.leading.equalTo(cardView).offset(50)
            $0.trailing.equalTo(cardView).offset(-50)
            $0.bottom.equalTo(cardView).offset(-50)
        }

        
        drawView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView)
        }
////
        drawTestTitle.snp.makeConstraints {
            $0.top.equalTo(drawView).offset(20)
            $0.leading.equalTo(drawView).offset(50)
        }

        drawContentTextView.snp.makeConstraints {
            $0.top.equalTo(drawTestTitle.snp.bottom).offset(10)
            $0.leading.equalTo(drawView).offset(50)
            $0.trailing.equalTo(drawView).offset(-30)
        }

        drawlongImage.snp.makeConstraints {
            $0.top.equalTo(drawContentTextView.snp.bottom).offset(80)
            $0.leading.equalTo(drawView).offset(50)
            $0.trailing.equalTo(drawView).offset(-50)
            $0.bottom.equalTo(drawView).offset(-80)
        }
        
     
    }
    
    
}

//
//  HomePageViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/20.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController,UIScrollViewDelegate {
    let width = UIScreen.main.bounds.size.width
    
    var currentIndex : NSInteger = 0
    var leftImageView = UIImageView()
    var rightImageView = UIImageView()
    var currentImageView = UIImageView()
    var imageArray = [String]()
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = ["heartlong","card"]
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
        reloadImage()
        setupTimer()
   
    }
    
    // 上方banner
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: width * 3, height: 150)
        scrollView.contentOffset = CGPoint(x: width, y: 663)
        scrollView.isPagingEnabled = true
        scrollView.frame = CGRect(x: 0, y: 663, width: width, height: 150)
        rightImageView.frame = CGRect(x: width * 2, y: 663, width: width, height: 150)
        currentImageView.frame = CGRect(x: width * 1, y: 663, width: width, height: 150)
        leftImageView.frame = CGRect(x: width * 0, y: 663, width: width, height: 150)
        scrollView.addSubview(rightImageView)
        scrollView.addSubview(currentImageView)
        scrollView.addSubview(leftImageView)
        scrollView.delegate = self
        return scrollView
    }()
    
    // 下方小圓點
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: scrollView.frame.maxY-20, width: width, height: 20)
        pageControl.backgroundColor = UIColor.clear
        //小圓點選取時顏色
        pageControl.currentPageIndicatorTintColor = UIColor.init(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //小圓點未選取顏色
        pageControl.pageIndicatorTintColor = UIColor.init(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2)
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        return pageControl
    }()
    

    /**
     * 更新圖片
     */
    func reloadImage(){
        var leftIndex = 0
        var rightIndex = 0
        currentIndex = currentIndex % imageArray.count
        scrollView.setContentOffset(CGPoint(x: width, y: 663), animated: false)
        pageControl.currentPage = (currentIndex - 1 + imageArray.count) % imageArray.count //防止越界
        leftIndex = (currentIndex - 1 + imageArray.count) % imageArray.count //防止越界
        rightIndex = (currentIndex + 1) % imageArray.count
        rightImageView.image = UIImage(named: imageArray[rightIndex])
        currentImageView.image = UIImage(named: imageArray[currentIndex])
        leftImageView.image = UIImage(named: imageArray[leftIndex])
        
    }
    /**
     * 更新timer
     */
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2,target:self,selector:#selector(timeChanged),userInfo:nil,repeats:true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
    }

    /**
     * time 事件
     */
    @objc func timeChanged(){
        currentIndex = currentIndex + 1
        //更新圖片+scrollView
        reloadImage()
    }
  
    /**
     * scrollView 滑動開始監聽
     */
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.invalidate()
    }

    /**
     * scrollView 滑動坄停止監聽
     */
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



    @IBAction func clickBtn(_ sender: Any) {
        
        
        transitionToProduct()
        
        
    }
    
    
    func transitionToProduct() {
        
        let ProductCollectionViewController =
            storyboard?.instantiateViewController(identifier: Constants.Storyboard.ProductCollectionViewController) as? ProductCollectionViewController
        
        view.window?.rootViewController = ProductCollectionViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

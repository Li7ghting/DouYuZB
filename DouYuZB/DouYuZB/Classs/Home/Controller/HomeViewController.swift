//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by canguang on 2019/3/8.
//  Copyright © 2019 canguang. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40
class HomeViewController: UIViewController {

    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: 0, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        //titleView.backgroundColor = UIColor.gray
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let edgeOptions:UIRectEdge = [.left, .bottom, .right]
        self.edgesForExtendedLayout = edgeOptions
        //1.设置 UI
         setupUI()
    }
}

// MARK:- 设置导航栏
extension HomeViewController {
    private func setupUI(){
        //0. 不设置系统 UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //1.设置导航栏
        setupNavigationBar()
        //2. 添加 titleVIew
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar() {
        //navigationController?.navigationBar.barTintColor = UIColor.black
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), for: .normal)
        //btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(clickHome), for: UIControl.Event.touchUpInside)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        //设置右侧的item
        //历史
        let size = CGSize(width: 40, height: 40)
        //let historyItem = UIBarButtonItem.createUIBarButtonItem(labelName: "历史", size: size)
        let historyItem = UIBarButtonItem(imageName: "历史", size: size)
        //搜索
        //let searchItem = UIBarButtonItem.createUIBarButtonItem(labelName: "搜索", size: size)
        let searchItem = UIBarButtonItem(imageName: "搜索", size: size)
        //二维码
        //let qrcodeItem = UIBarButtonItem.createUIBarButtonItem(labelName: "二维码", size: size)
        //let qrcodeItem = UIBarButtonItem(labelName: "二维码", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "二维码", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
    
    @objc private func clickHome(){
        print("click Home !")
    }
}

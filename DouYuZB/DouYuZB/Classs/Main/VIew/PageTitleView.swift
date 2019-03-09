//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by canguang on 2019/3/9.
//  Copyright © 2019 canguang. All rights reserved.
//

import UIKit

private let scrollViewLineH : CGFloat = 2
class PageTitleView: UIView {

    //定义属性
    private var titles : [String]
    //创建 UILabel 数组
    private lazy var titleLabels : [UILabel] = [UILabel]()
    //懒加载属性
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = false //可以不设置，默认是0
        return scrollView
    }()
    //懒加载 label 底部线条
    private lazy var labelLine : UIView = {
       let labelLine = UIView()
        labelLine.backgroundColor = UIColor.orange
        return labelLine
    }()
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        //设置ui界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    private func setupUI() {
        //1.添加 UISCrollView
        addSubview(scrollView)
        scrollView.frame = bounds //注意设置 scrollView 的大小
        //2.title 对应的 label
        setupTitleLabels()
        //3.设置底线和滚动滑块
        setupBottomLineAndScrollViewLine()
    }
    
    private func setupTitleLabels() {
        let labelY : CGFloat = 0
        let labelW : CGFloat = frame.width/CGFloat(titles.count)
        let labelH : CGFloat = frame.height - scrollViewLineH
        
        for (index, title) in titles.enumerated() {
            //1.创建label
            let label = UILabel()
            //2. 设置属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            //3.设置 label 的 frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            //4.添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    private func setupBottomLineAndScrollViewLine() {
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //底部滑块
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(labelLine)
        labelLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - scrollViewLineH, width: firstLabel.frame.width, height: scrollViewLineH)
    }
}

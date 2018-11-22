//
//  FirstVC.swift
//  ScreenOrientationDemo
//
//  Created by Skye on 2018/3/1.
//  Copyright © 2018年 Skye. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    //MARK: - life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        navigationItem.title = "第一页"
        
        view.addSubview(jumpToNextPageBtn)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let btnOrigin = CGPoint.init(x: (view.bounds.width - 200) / 2.0, y: 100)
        jumpToNextPageBtn.frame = CGRect.init(origin: btnOrigin, size: CGSize.init(width: 200, height: 100))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //如果不设置该页面的竖屏， 在屏幕锁定打开的情况下，竖屏First -> 横屏Second -> 切换到后台 -> 进入前台 -> 返回竖屏First 会出现状态栏已竖屏，其他内容仍然横屏切换的问题
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - lazy
    
    lazy var jumpToNextPageBtn: UIButton = {
        [weak self] in
        
        let button = UIButton()
        button.backgroundColor = UIColor.yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("跳转下一页面(横屏)", for: .normal)
        button.addTarget(self, action: #selector(onClickJumpToNextPageBtnAction), for: .touchUpInside)
        
        return button
        }()
    
    //MARK: - action
    
    @objc func onClickJumpToNextPageBtnAction(){
        //进入下一页面，转换为横屏
        let rotation : UIInterfaceOrientationMask = [.landscapeLeft, .landscapeRight]
        kAppdelegate?.blockRotation = rotation
        
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


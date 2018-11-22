//
//  SecondVC.swift
//  ScreenOrientationDemo
//
//  Created by Skye on 2018/3/1.
//  Copyright © 2018年 Skye. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: - life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        
        navigationItem.title = "第二页"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(onClickBackBtnAction))
        
        view.addSubview(jumpToNextPageBtn)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let btnOrigin = CGPoint.init(x: (view.bounds.width - 200) / 2.0, y: 100)
        jumpToNextPageBtn.frame = CGRect.init(origin: btnOrigin, size: CGSize.init(width: 200, height: 100))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //设置原因： 手机竖屏进入横屏，状态栏默认隐藏；iPad显示异常
        UIApplication.shared.setStatusBarHidden(false, with: .none)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - lazy
    
    lazy var jumpToNextPageBtn: UIButton = {
        [weak self] in
        
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("跳转下一页面(横屏)", for: .normal)
        button.addTarget(self, action: #selector(onClickJumpToNextPageBtnAction), for: .touchUpInside)
        
        return button
        }()
    
    //MARK: - action
    
    @objc func onClickJumpToNextPageBtnAction(){
        let thirdVC = ThirdVC()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @objc func onClickBackBtnAction(){
        //设置竖屏
        kAppdelegate?.blockRotation = .portrait
        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


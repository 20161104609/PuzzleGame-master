//
//  PuzzleView.swift
//  PuzzleGame
//
//  Created by Sekorm on 2018/12/9.
//  Copyright © 2018年 20161104609. All rights reserved.
//

import UIKit
//展示每个小图的属性       每个添加手势     用于视图
class PuzzleView: UIImageView {

    var puzzle : Puzzle?{
    
        didSet{
            self.image = puzzle?.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.0/UIScreen.main.scale
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

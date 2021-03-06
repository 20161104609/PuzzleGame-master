//
//  ViewController.swift
//  PuzzleGame
//
//  Created by Sekorm on 2018/12/9.
//  Copyright © 2012年 20161104609. All rights reserved.
//

import UIKit
// 链接图片  不整个分成3 份
class ViewController: UIViewController {

    var container : UIView!
    let emptyPuzzle : Puzzle = Puzzle.init(image: UIImage.init(), withCol: 2, withRow: 2)
    let width = UIScreen.main.bounds.width/3.0
    let height = UIScreen.main.bounds.width/3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        container = UIView.init(frame:CGRect(x: 0, y:50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        container.backgroundColor = UIColor.lightGray
        self.view.addSubview(container)
        
        let orginImage = UIImage.init(named: "1")
        
        for i in 0..<8{
            
            let col = i % 3
            let row = i / 3
            let rect = CGRect(x: CGFloat(col) * width, y:CGFloat(row) * height, width: width, height: height)
            let image = self.clipImageInRect(rect: rect, orginImage: orginImage!)
          
            let puzzle = Puzzle.init(image: image, withCol: col , withRow: row)
            
            let puzzleView = PuzzleView.init(frame: rect)
            puzzleView.puzzle = puzzle
            puzzleView.backgroundColor = UIColor.red
            container.addSubview(puzzleView)
            
            puzzleView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(click)))
        }
    }
    //确定移动位置  控制器中添加并布局好9个PuzzleView，每个PuzzleView添加点击手势。
    //每次移动时，通过这个PuzzleView 和点击的PuzzleView对比位置，相邻则可以移动。否则不做任何处理
    
    func click(tap: UITapGestureRecognizer) {
        let puzzleView = tap.view as! PuzzleView
        let puzzle = puzzleView.puzzle!
        
        let col = puzzle.col
        let row = puzzle.row
        
        if col == emptyPuzzle.col  {
            if row! - emptyPuzzle.row == 1 {
                puzzle.move(direction: .DirectionUp)
                puzzleView.frame.origin.y -= height
                emptyPuzzle.move(direction: .DirectionDown)
            }
            if row! - emptyPuzzle.row == -1 {
                puzzle.move(direction: .DirectionDown)
                puzzleView.frame.origin.y += height
                emptyPuzzle.move(direction: .DirectionUp)
            }
        }
        
        if row == emptyPuzzle.row  {
            if col! - emptyPuzzle.col == 1 {
                puzzle.move(direction: .DirectionLeft)
                puzzleView.frame.origin.x -= width
                emptyPuzzle.move(direction: .DirectionRight)
            }
            if col! - emptyPuzzle.col == -1 {
                puzzle.move(direction: .DirectionRight)
                puzzleView.frame.origin.x += width
                emptyPuzzle.move(direction: .DirectionLeft)
            }
        }
    }
    
    func clipImageInRect(rect: CGRect, orginImage: UIImage) -> UIImage{
        let imageRef = orginImage.cgImage!.cropping(to: rect);
        let thumbScale = UIImage.init(cgImage: imageRef!)
        return thumbScale;
    }
}


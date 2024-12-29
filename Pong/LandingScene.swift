//
//  LandingScene.swift
//  Pong
//
//  Created by Teddy Foster on 3/27/23.
//

import Foundation
import SpriteKit

class LandingScene: SKScene{
    
    var title = SKLabelNode()
    var p1Button = SKSpriteNode()
    var p2Button = SKSpriteNode()
    var settingsButton = SKSpriteNode()
    var cosmeticButton = SKSpriteNode()
    
    var difficulties = SKLabelNode()
    var easyButton = SKSpriteNode()
    var mediumButton = SKSpriteNode()
    var hardButton = SKSpriteNode()
    
    var speeds = SKLabelNode()
    var slowButton = SKSpriteNode()
    var mediumSpeedButton = SKSpriteNode()
    var fastButton = SKSpriteNode()
    
    var scores = SKLabelNode()
    var n7Button = SKSpriteNode()
    var n21Button = SKSpriteNode()
    var infinityButton = SKSpriteNode()
    
    var temp1 = SKSpriteNode()
    var temp2 = SKSpriteNode()
    var pColor = UIColor(white: 1, alpha: 1)
    var uColor = UIColor(white: 1, alpha: 1)
    
    var backButton = SKSpriteNode()
    
    var paddleTitle = SKLabelNode()
    var paddleBack = SKSpriteNode()
    
    var redButton = SKSpriteNode()
    var greenButton = SKSpriteNode()
    var whiteButton = SKSpriteNode()
    var cyanButton = SKSpriteNode()
    var pinkButton = SKSpriteNode()
    
    var redTitle = SKLabelNode()
    var greenTitle = SKLabelNode()
    var whiteTitle = SKLabelNode()
    var cyanTitle = SKLabelNode()
    var pinkTitle = SKLabelNode()

    
    var selectedArrow = SKLabelNode()
    
    
    override func didMove(to view: SKView) {
        paddleTitle = childNode(withName: "paddleTitle") as! SKLabelNode
        paddleBack = childNode(withName: "colorBackButton") as! SKSpriteNode
        
        selectedArrow = childNode(withName: "selectedTitle") as! SKLabelNode
        
        
        redButton = childNode(withName: "redButton") as! SKSpriteNode
        greenButton = childNode(withName: "greenButton") as! SKSpriteNode
        whiteButton = childNode(withName: "whiteButton") as! SKSpriteNode
        cyanButton = childNode(withName: "cyanButton") as! SKSpriteNode
        pinkButton = childNode(withName: "pinkButton") as! SKSpriteNode
        
        
            redTitle = childNode(withName: "redTitle") as! SKLabelNode
            greenTitle = childNode(withName: "greenTitle") as! SKLabelNode
            whiteTitle = childNode(withName: "whiteTitle") as! SKLabelNode
            cyanTitle = childNode(withName: "cyanTitle") as! SKLabelNode
            pinkTitle = childNode(withName: "pinkTitle") as! SKLabelNode
    
        title = childNode(withName: "Title") as! SKLabelNode
        p1Button = childNode(withName: "p1Button") as! SKSpriteNode
        p1Button.name = "p1Button"
        p2Button = childNode(withName: "p2Button") as! SKSpriteNode
        p2Button.name = "p2Button"
        settingsButton = childNode(withName: "settingsButton") as! SKSpriteNode
        settingsButton.name = "settingsButton"
        cosmeticButton = childNode(withName: "cosmeticButton") as! SKSpriteNode
        
        temp1 = childNode(withName: "darkRed") as! SKSpriteNode
        temp2 = childNode(withName: "lightRed") as! SKSpriteNode
        let pickedColor = temp1.color
        let unpickedColor = temp2.color
        pColor = pickedColor
        uColor = unpickedColor
        
        backButton = childNode(withName: "backButton") as! SKSpriteNode
        
        //Settings Buttons
        difficulties = childNode(withName: "difficultyTitle") as! SKLabelNode
        easyButton = childNode(withName: "easyButton") as! SKSpriteNode
        mediumButton = childNode(withName: "mediumButton") as! SKSpriteNode
        hardButton = childNode(withName: "hardButton") as! SKSpriteNode
        
        //Speed Buttons
        speeds = childNode(withName: "speedTitle") as! SKLabelNode
        slowButton = childNode(withName: "slowButton") as! SKSpriteNode
        mediumSpeedButton = childNode(withName: "mediumSpeedButton") as! SKSpriteNode
        fastButton = childNode(withName: "fastButton") as! SKSpriteNode
        
        //Winning Score Buttons
        scores = childNode(withName: "scoreTitle") as! SKLabelNode
        n7Button = childNode(withName: "n7Button") as! SKSpriteNode
        n21Button = childNode(withName: "n21Button") as! SKSpriteNode
        infinityButton = childNode(withName: "infinityButton") as! SKSpriteNode
        
        
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let positionInScene = touch.location(in: self)
        
        if p1Button.frame.contains(positionInScene)
        {
            GameScene.playercount1 = true
            let gameScene = GameScene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFit
            view?.presentScene(gameScene!)
        }
        if p2Button.frame.contains(positionInScene)
        {
            GameScene.playercount1 = false
            let gameScene = GameScene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFit
            view?.presentScene(gameScene!)
        }
        if settingsButton.frame.contains(positionInScene){
            settingAppear()
        }
        
        if slowButton.frame.contains(positionInScene){
            GameScene.speed = "slow"
            slowButton.color = pColor
            mediumSpeedButton.color = uColor
            fastButton.color = uColor
        }
        if mediumSpeedButton.frame.contains(positionInScene){
            GameScene.speed = "medium"
            slowButton.color = uColor
            mediumSpeedButton.color = pColor
            fastButton.color = uColor
        }
        if fastButton.frame.contains(positionInScene){
            GameScene.speed = "fast"
            slowButton.color = uColor
            mediumSpeedButton.color = uColor
            fastButton.color = pColor
        }
        
        if n7Button.frame.contains(positionInScene){
            GameScene.winningScore = 7
            n7Button.color = pColor
            n21Button.color = uColor
            infinityButton.color = uColor
        }
        if n21Button.frame.contains(positionInScene){
            GameScene.winningScore = 21
            n7Button.color = uColor
            n21Button.color = pColor
            infinityButton.color = uColor
        }
        if infinityButton.frame.contains(positionInScene){
            GameScene.winningScore = 9999999
            n7Button.color = uColor
            n21Button.color = uColor
            infinityButton.color = pColor
        }
        
        if easyButton.frame.contains(positionInScene){
            GameScene.difficulty = "easy"
            easyButton.color = pColor
            mediumButton.color = uColor
            hardButton.color = uColor
        }
        if mediumButton.frame.contains(positionInScene){
            GameScene.difficulty = "medium"
            easyButton.color = uColor
            mediumButton.color = pColor
            hardButton.color = uColor
        }
        if hardButton.frame.contains(positionInScene){
            GameScene.difficulty = "hard"
            easyButton.color = uColor
            mediumButton.color = uColor
            hardButton.color = pColor
        }
        if backButton.frame.contains(positionInScene){
            settingDisappear()
        }
        if cosmeticButton.frame.contains(positionInScene){
            cosmeticAppear()
            
            
        }
        if redButton.frame.contains(positionInScene){
            GameScene.paddleColor = UIColor.systemRed
            selectedArrow.position.x = 75
        }
        if greenButton.frame.contains(positionInScene){
            GameScene.paddleColor = UIColor.systemGreen
            selectedArrow.position.x = 200
        }
        if whiteButton.frame.contains(positionInScene){
            GameScene.paddleColor = UIColor.white
            selectedArrow.position.x = 406
        }
        if cyanButton.frame.contains(positionInScene){
            GameScene.paddleColor = UIColor.systemCyan
            selectedArrow.position.x = 612
        }
        if pinkButton.frame.contains(positionInScene){
            GameScene.paddleColor = UIColor.systemPink
            selectedArrow.position.x = 737
        }
        if paddleBack.frame.contains(positionInScene){
            cosmeticDissappear()
        }


    }
    func cosmeticAppear(){
            p1Button.run(SKAction.move(to: CGPoint(x: -400, y: 200), duration: 1))
            p2Button.run(SKAction.move(to: CGPoint(x: 1200, y: 200), duration: 1))
            settingsButton.run(SKAction.move(to: CGPoint(x: -400, y: 80), duration: 1))
            title.run(SKAction.move(to: CGPoint(x: 406, y: 775), duration: 2))
            cosmeticButton.run(SKAction.move(to: CGPoint(x: 1200, y: 80), duration: 1))
        
        whiteButton.run(SKAction.move(to: CGPoint(x: 406, y: 180), duration: 1.5))
        redButton.run(SKAction.move(to: CGPoint(x: 75, y: 180), duration: 1.5))
        greenButton.run(SKAction.move(to: CGPoint(x: 200, y: 180), duration: 1.5))
        cyanButton.run(SKAction.move(to: CGPoint(x: 612, y: 180), duration: 1.5))
        pinkButton.run(SKAction.move(to: CGPoint(x: 737, y: 180), duration: 1.5))
        
        selectedArrow.run(SKAction.move(to: CGPoint(x: selectedArrow.position.x, y: 100), duration: 1.5))
        
        whiteTitle.run(SKAction.move(to: CGPoint(x: 406, y: 255), duration: 1.5))
        redTitle.run(SKAction.move(to: CGPoint(x: 75, y: 255), duration: 1.5))
        greenTitle.run(SKAction.move(to: CGPoint(x: 200, y: 255), duration: 1.5))
        cyanTitle.run(SKAction.move(to: CGPoint(x: 612, y: 255), duration: 1.5))
        pinkTitle.run(SKAction.move(to: CGPoint(x: 737, y: 255), duration: 1.5))
        
        paddleBack.run(SKAction.move(to: CGPoint(x: 406, y: 55), duration: 1.5))
        paddleTitle.run(SKAction.move(to: CGPoint(x: 406, y: 330), duration: 1.5))
    }
    func cosmeticDissappear(){
        
            p1Button.run(SKAction.move(to: CGPoint(x: 203, y: 200), duration: 1))
            p2Button.run(SKAction.move(to: CGPoint(x: 609, y: 200), duration: 1))
            settingsButton.run(SKAction.move(to: CGPoint(x: 203, y: 80), duration: 1))
            cosmeticButton.run(SKAction.move(to: CGPoint(x: 609, y: 80), duration: 1))
            title.run(SKAction.move(to: CGPoint(x: 406, y: 290), duration: 2))
        
        whiteButton.run(SKAction.move(to: CGPoint(x: 406, y: -250), duration: 1.5))
        redButton.run(SKAction.move(to: CGPoint(x: 75, y: -250), duration: 1.5))
        greenButton.run(SKAction.move(to: CGPoint(x: 200, y: -250), duration: 1.5))
        cyanButton.run(SKAction.move(to: CGPoint(x: 612, y: -250), duration: 1.5))
        pinkButton.run(SKAction.move(to: CGPoint(x: 737, y: -250), duration: 1.5))
        
        whiteTitle.run(SKAction.move(to: CGPoint(x: 406, y: -175), duration: 1.5))
        redTitle.run(SKAction.move(to: CGPoint(x: 75, y: -175), duration: 1.5))
        greenTitle.run(SKAction.move(to: CGPoint(x: 200, y: -175), duration: 1.5))
        cyanTitle.run(SKAction.move(to: CGPoint(x: 612, y: -175), duration: 1.5))
        pinkTitle.run(SKAction.move(to: CGPoint(x: 737, y: -175), duration: 1.5))
        
        paddleBack.run(SKAction.move(to: CGPoint(x: 406, y: -400), duration: 1.5))
        paddleTitle.run(SKAction.move(to: CGPoint(x: 406, y: -100), duration: 1.5))
        selectedArrow.run(SKAction.move(to: CGPoint(x: selectedArrow.position.x, y: -300), duration: 1.5))
    }
    
    
    
    func settingAppear(){
        p1Button.run(SKAction.move(to: CGPoint(x: -400, y: 200), duration: 1))
        p2Button.run(SKAction.move(to: CGPoint(x: 1200, y: 200), duration: 1))
        settingsButton.run(SKAction.move(to: CGPoint(x: -400, y: 80), duration: 1))
        title.run(SKAction.move(to: CGPoint(x: 406, y: 775), duration: 2))
        cosmeticButton.run(SKAction.move(to: CGPoint(x: 1200, y: 80), duration: 1))
        
        difficulties.run(SKAction.move(to: CGPoint(x: 659, y: 335), duration: 1.5))
        easyButton.run(SKAction.move(to: CGPoint(x: 659, y: 280), duration: 1.5))
        mediumButton.run(SKAction.move(to: CGPoint(x: 659, y: 205), duration: 1.5))
        hardButton.run(SKAction.move(to: CGPoint(x: 659, y: 130), duration: 1.5))
        
        scores.run(SKAction.move(to: CGPoint(x: 406, y: 335), duration: 1.5))
        n7Button.run(SKAction.move(to: CGPoint(x: 406, y: 280), duration: 1.5))
        n21Button.run(SKAction.move(to: CGPoint(x: 406, y: 205), duration: 1.5))
        infinityButton.run(SKAction.move(to: CGPoint(x: 406, y: 130), duration: 1.5))
        
        speeds.run(SKAction.move(to: CGPoint(x: 153, y: 335), duration: 1.5))
        slowButton.run(SKAction.move(to: CGPoint(x: 153, y: 280), duration: 1.5))
        mediumSpeedButton.run(SKAction.move(to: CGPoint(x: 153, y: 205), duration: 1.5))
        fastButton.run(SKAction.move(to: CGPoint(x: 153, y: 130), duration: 1.5))
        
        backButton.run(SKAction.move(to: CGPoint(x: 406, y: 55), duration: 1.5))
    }
    func settingDisappear(){
        p1Button.run(SKAction.move(to: CGPoint(x: 203, y: 200), duration: 1))
        p2Button.run(SKAction.move(to: CGPoint(x: 609, y: 200), duration: 1))
        settingsButton.run(SKAction.move(to: CGPoint(x: 203, y: 80), duration: 1))
        cosmeticButton.run(SKAction.move(to: CGPoint(x: 609, y: 80), duration: 1))
        title.run(SKAction.move(to: CGPoint(x: 406, y: 290), duration: 2))
        
        difficulties.run(SKAction.move(to: CGPoint(x: 659, y: 730), duration: 1))
        easyButton.run(SKAction.move(to: CGPoint(x: 659, y: 675), duration: 1))
        mediumButton.run(SKAction.move(to: CGPoint(x: 659, y: 600), duration: 1))
        hardButton.run(SKAction.move(to: CGPoint(x: 659, y: 525), duration: 1))
        
        scores.run(SKAction.move(to: CGPoint(x: 406, y: 730), duration: 1))
        n7Button.run(SKAction.move(to: CGPoint(x: 406, y: 675), duration: 1))
        n21Button.run(SKAction.move(to: CGPoint(x: 406, y: 600), duration: 1))
        infinityButton.run(SKAction.move(to: CGPoint(x: 406, y: 525), duration: 1))
        
        speeds.run(SKAction.move(to: CGPoint(x: 153, y: 730), duration: 1))
        slowButton.run(SKAction.move(to: CGPoint(x: 153, y: 675), duration: 1))
        mediumSpeedButton.run(SKAction.move(to: CGPoint(x: 153, y: 600), duration: 1))
        fastButton.run(SKAction.move(to: CGPoint(x: 153, y: 625), duration: 1))
        
        backButton.run(SKAction.move(to: CGPoint(x: 406, y: 450), duration: 1))
    }
    override func update(_ currentTime: TimeInterval) {
        if GameScene.difficulty == "easy"{
            
        }
    }
    
    
}

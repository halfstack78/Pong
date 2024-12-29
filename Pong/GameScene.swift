//
//  GameScene.swift
//  Pong
//
//  Created by  on 3/22/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball = SKSpriteNode()
    var paddle1 = SKSpriteNode()
    var paddle2 = SKSpriteNode()
    var score1 = 0
    var score2 = 0
    var score1display = SKLabelNode(text: "0")
    var score2display = SKLabelNode(text: "0")
    var turn = false
    public static var playercount1 = true
    public static var difficulty = "medium"
    public static var speed = "medium"
    public static var paddleColor = UIColor.white
    var speedNum = 500
    public static var winningScore = 7
    var winner = "none"
    private var currentNode: SKNode?
    
    var tempxvelo = CGFloat(0)
    var tempyvelo = CGFloat(0)
    
    var pauseScreen = SKSpriteNode()
    var pauseButton = SKSpriteNode()
    var startButton = SKSpriteNode()
    var playAgainButton = SKSpriteNode()
    var playerWon = SKLabelNode()
    var homeButton = SKSpriteNode()
    var resumeButton = SKSpriteNode()
    
    var pause = false
    var waitPeriod = false
    var waited = false
    
    var difficultyNum = 0.4
    
    var prevPosition = 0
    
    var isFingerOnPaddle = false
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self

        
        pauseScreen = childNode(withName: "pauseScreen") as! SKSpriteNode
        pauseButton = childNode(withName: "pauseButton") as! SKSpriteNode
        startButton = childNode(withName: "startButton") as! SKSpriteNode
        playAgainButton = childNode(withName: "playAgainButton") as! SKSpriteNode
        homeButton = childNode(withName: "homebutton") as! SKSpriteNode
        resumeButton = childNode(withName: "resumeButton") as! SKSpriteNode
        playerWon = childNode(withName: "playerWon") as! SKLabelNode
        
        
        
        ball = childNode(withName: "ball") as! SKSpriteNode
        paddle1 = childNode(withName: "paddle1") as! SKSpriteNode
        paddle2 = childNode(withName: "paddle2") as! SKSpriteNode
        paddle1.color = GameScene.paddleColor
        paddle2.color = GameScene.paddleColor
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        borderBody.restitution = 2
        self.physicsBody = borderBody
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0)
        
        
        
        score1display.position = CGPoint(x: 376, y: 325)
        score2display.position = CGPoint(x: 436, y: 325)
        score1display.zPosition = 100
        score2display.zPosition = 100
        self.addChild(score1display)
        self.addChild(score2display)
        
        ball.physicsBody!.contactTestBitMask = ball.physicsBody!.collisionBitMask
        
        paddle1.name = "draggable"
        if GameScene.playercount1 == false{
            paddle2.name = "draggable"
        }
    
        
        
        if GameScene.playercount1 == true{
            run(SKAction.repeatForever(
                        SKAction.sequence([
                            SKAction.run(followBall),
                            SKAction.wait(forDuration: 0.4)
                            ])
                    ))
        }
        onPlay()
        
        
    }
    func followBall() {
        var ynum = ball.position.y
        if(ball.position.y <= 65){
            ynum = 65
        }
        if(ball.position.y >= 310){
            ynum = 310
        }
        let move = SKAction.moveTo(y: ynum, duration: difficultyNum)
        paddle2.run(move)
    }
    func startBall(){
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        turn.toggle()
        var rand: Int = 0
        rand = Int.random(in: -150..<150)
        ball.position = CGPoint(x: 406, y: 175)
        waitPeriod = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if(self.pause == false){
                self.ball.physicsBody?.velocity = CGVectorMake(CGFloat(self.turn ? self.speedNum : -self.speedNum), CGFloat(rand))
                self.waitPeriod = false
            }
        }
    }
    func onPlay(){
        if(GameScene.speed == "slow"){
            speedNum = 500
        }else if(GameScene.speed == "medium"){
            speedNum = 1000
        }else if(GameScene.speed == "fast"){
            speedNum = 1500
        }
        if(GameScene.difficulty == "easy"){
            difficultyNum = 0.6
        }else if(GameScene.difficulty == "medium"){
            difficultyNum = 0.4
        }else if(GameScene.difficulty == "hard"){
            difficultyNum = 0.2
        }
        pauseScreen.position = CGPoint(x: 406, y: 1000)
        homeButton.position = CGPoint(x: 406, y: 1000)
        playAgainButton.position = CGPoint(x: 406, y: 1000)
        playerWon.position = CGPoint(x: 406, y: 1000)
        score1 = 0
        score2 = 0
        score1display.text = "0"
        score2display.text = "0"
        startBall()
        
        
    }
    
    func onWin(){
        pauseScreen.position = CGPoint(x: 406, y: 187.5)
        homeButton.position = CGPoint(x: 406, y: 93.75)
        playAgainButton.position = CGPoint(x: 406, y: 187.5)
        playerWon.position = CGPoint(x: 406, y: 281.25)
        playerWon.text = "\(winner) Won!"
        
        
    }
    func onResume(){
        pause = false
        
        pauseScreen.position = CGPoint(x: 1000, y: 1000)
        homeButton.position = CGPoint(x: 1000, y: 1000)
        resumeButton.position = CGPoint(x: 1000, y: 1000)
        
        ball.physicsBody?.velocity.dx = tempxvelo
        ball.physicsBody?.velocity.dy = tempyvelo
        paddle1.name = "draggable"
        paddle2.name = "draggable"
        
        if(waited){
            startBall()
            waited = false
        }
    }
    func onPause(){
        pause = true
        
        tempxvelo = (ball.physicsBody?.velocity.dx ?? 0)!
        tempyvelo = (ball.physicsBody?.velocity.dy ?? 0)!
        ball.physicsBody?.velocity.dx = 0
        ball.physicsBody?.velocity.dy = 0
        
        if(waitPeriod){
            waited = true
        }
        
        pauseScreen.position = CGPoint(x: 406, y: 187.5)
        homeButton.position = CGPoint(x: 609, y: 187.5)
        resumeButton.position = CGPoint(x: 203, y: 187.5)
        paddle1.name = "undraggable"
        paddle2.name = "undraggable"
        
        
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
        let location = touch.location(in: self)
            
            let touchesNodes = self.nodes(at: location)
            for paddle1 in touchesNodes.reversed() {
                if paddle1.name == "draggable" {
                    self.currentNode = paddle1
                }
            }
            if resumeButton.frame.contains(location)
            {
                onResume()
            }
            if homeButton.frame.contains(location)
            {
                let landingScene = GameScene(fileNamed: "LandingScene")
                landingScene?.scaleMode = .aspectFit
                view?.presentScene(landingScene!)
            }
            if startButton.frame.contains(location)
            {
                onPlay()
            }
            if playAgainButton.frame.contains(location)
            {
                onPlay()
            }
            if pauseButton.frame.contains(location)
            {
                onPause()
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }

        if let touch = touches.first, let paddle1 = self.currentNode {
            let touchLocation = touch.location(in: self)
            paddle1.position = touchLocation
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        self.currentNode = nil
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if(Int((ball.physicsBody?.velocity.dy)!) <= 5 &&
           Int((ball.physicsBody?.velocity.dy)!) >= -5 && waitPeriod == false && ball.position.y < 150 && pause == false){
            ball.physicsBody?.velocity.dy += 100
        }
        if(Int((ball.physicsBody?.velocity.dy)!) <= 5 &&
           Int((ball.physicsBody?.velocity.dy)!) >= -5 && waitPeriod == false && ball.position.y > 150 && pause == false){
            ball.physicsBody?.velocity.dy -= 100
        }
            
        //print(Int((ball.physicsBody?.velocity.dy)!) <= 20 &&
              //Int((ball.physicsBody?.velocity.dy)!) >= -20)
        
        if(ball.position.x < 90){
            score2 += 1
            score2display.text = String(score2)
            if(score2 >= GameScene.winningScore){
                winner = "Player 2"
                onWin()
            }
            startBall()
        }else if(ball.position.x > self.frame.width - 90){
            score1 += 1
            score1display.text = String(score1)
            if(score1 >= GameScene.winningScore){
                winner = "Player 1"
                onWin()
            }
            startBall()
        }
        
        
        paddle1.position.x = 100
        if(paddle1.position.y <= 65){
            paddle1.position.y = 65
        }
        if(paddle1.position.y >= 310){
            paddle1.position.y = 310
        }
        
        paddle2.position.x = 712
        if(paddle2.position.y <= 65){
            paddle2.position.y = 65
        }
        if(paddle2.position.y >= 310){
            paddle2.position.y = 310
        }
    }
}

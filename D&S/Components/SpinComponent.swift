//
//  SpinComponent.swift
//  D&S
//
//  Created by Adam Syam Nursal on 19/05/26.
//

import Foundation
import GameplayKit

class SpinComponent: GKComponent {
    
    var currentElement : Element!
    var isSpinning: Bool = false
    
    let randomSource = GKRandomDistribution(lowestValue: 0, highestValue: Element.allCases.count - 1)
    
    static func make() -> SpinComponent {
        let Component = SpinComponent()
        Component.currentElement = .fire
        return Component
        
    }
    
    override func didAddToEntity() {
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else { return }
        sprite.node.texture = SKTexture(imageNamed: currentElement.rawValue)
    }

    func spin(){
        if isSpinning { return }
        guard let sprite = entity?.component(ofType: SpriteComponent.self) else { return }

        isSpinning = true

        let randomIndex = randomSource.nextInt()
        let randomelement = Element.allCases[randomIndex]
        currentElement = randomelement

        let scaleDown = SKAction.scaleY(to: 0.0, duration: 0.15)
        let scaleUp = SKAction.scaleY(to: 1.0, duration: 0.15)

        let changetexture = SKAction.run {
            sprite.node.texture = SKTexture(imageNamed: randomelement.rawValue)
        }
        
        let spinAction = SKAction.sequence([scaleDown,changetexture,scaleUp])
        
        sprite.node.run(spinAction){
            self.isSpinning = false
        }
    }
    
    func getResult() -> Element {
        return currentElement
    }
    
}


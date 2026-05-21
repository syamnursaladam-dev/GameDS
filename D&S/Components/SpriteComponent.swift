// SpriteComponent.swift
import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    var node: SKSpriteNode!
    
    // MARK: Initiate Component (berguna untuk sprite yang ada animasi dan digunakan pada scene)
    static func make(node: SKSpriteNode) -> SpriteComponent {
        let component = SpriteComponent()
        component.node = node
        return component
    }
}

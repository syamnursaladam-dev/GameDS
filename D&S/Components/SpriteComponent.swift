// SpriteComponent.swift
import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    var node: SKSpriteNode!

    static func make(node: SKSpriteNode) -> SpriteComponent {
        let component = SpriteComponent()
        component.node = node
        return component
    }
}

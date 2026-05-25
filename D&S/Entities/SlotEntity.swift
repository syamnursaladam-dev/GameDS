//
//  SlotEntity.swift
//  D&S
//
//  Created by Adam Syam Nursal on 19/05/26.
//

import SpriteKit
import GameplayKit

class SlotEntity: GKEntity {
    // MARK: Initiate Gamescene
    
    static func makeAll(from baseName: String, count: Int, in scene: SKScene) -> [SlotEntity] {
        return (1...count).compactMap { i in
            (scene.childNode(withName: "//\(baseName)_\(i)") as? SKSpriteNode).map { build(node: $0) }
        }
    }
    
    // MARK: Initiate Entity
    private static func build(node: SKSpriteNode) -> SlotEntity {
        let entity = SlotEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(SpinComponent.make())
        return entity
    }
}

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
            guard let node = scene.childNode(withName: "//\(baseName)_\(i)") as? SKSpriteNode else {
                print("\(baseName)_\(i) node not found")
                return nil
            }
            return build(node: node)
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

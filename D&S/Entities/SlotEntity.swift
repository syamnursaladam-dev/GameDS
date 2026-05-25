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
    
    static func make(from baseName: String, in scene: SKScene) -> [SlotEntity] {
        var result: [SlotEntity] = []
        for i in 1... {
            guard let node = scene.childNode(withName: "//\(baseName)_\(i)") as? SKSpriteNode else { break }
            result.append(build(node: node))
        }
        return result
    }
    
    // MARK: Initiate Entity
    private static func build(node: SKSpriteNode) -> SlotEntity {
        let entity = SlotEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(SpinComponent.make())
        return entity
    }
}

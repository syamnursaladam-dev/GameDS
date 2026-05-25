//
//  EnemyEntity.swift
//  D&S
//

import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {

    // MARK: Initiate Entity
    private static func build(node: SKSpriteNode) -> EnemyEntity {
        let entity = EnemyEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(IdleComponent.make(actionName: "idle"))
        entity.addComponent(SpinComponent.make())
        entity.addComponent(HealthComponent.make(stats: CharacterStatsPreset.enemy))
        return entity
    }

    // MARK: Initiate GameScene
    static func make(from nodeName: String, in scene: SKScene) -> EnemyEntity? {
        guard let node = scene.childNode(withName: "//\(nodeName)") as? SKSpriteNode else { return nil }
        let entity = build(node: node)
        entity.component(ofType: IdleComponent.self)?.start()
        return entity
    }
}


// HeroEntity.swift
import SpriteKit
import GameplayKit

class HeroEntity: GKEntity {
    // MARK: Initiate Gamescene
    static func make(from nodeName: String, in scene: SKScene) -> HeroEntity? {
        guard let node = scene.childNode(withName: "//\(nodeName)") as? SKSpriteNode else {
            print("\(nodeName) node not found")
            return nil
        }
        let entity = build(node: node)
        entity.component(ofType: IdleComponent.self)?.start()
        return entity
    }
    // MARK: Initiate Entity
    private static func build(node: SKSpriteNode) -> HeroEntity {
        let entity = HeroEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(IdleComponent.make(actionName: "idle"))
        entity.addComponent(HealthComponent.make(stats: CharacterStatsPreset.hero))
        return entity
    }

}

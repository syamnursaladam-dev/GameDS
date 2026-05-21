// HeroEntity.swift
import SpriteKit
import GameplayKit

class HeroEntity: GKEntity {
    
    static func make(node: SKSpriteNode) -> HeroEntity {
        let entity = HeroEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(IdleComponent.make(actionName: "idle"))
        entity.addComponent(HealthComponent.make(stats: CharacterStatsPreset.hero))
        return entity
    }
}

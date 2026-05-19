//
//  SlotEntity.swift
//  D&S
//
//  Created by Adam Syam Nursal on 19/05/26.
//

import Foundation
import GameplayKit

class SlotEntity: GKEntity {
    static func setup(node : SKSpriteNode)-> SlotEntity{
        let entity = SlotEntity()
        entity.addComponent(SpriteComponent.make(node: node))
        entity.addComponent(SpinComponent.make())
        return entity
    }
}

//static func make(node: SKSpriteNode) -> HeroEntity {
//    let entity = HeroEntity()
//    entity.addComponent(SpriteComponent.make(node: node))
//    entity.addComponent(IdleComponent.make(actionName: "idle"))
//    return entity
//}

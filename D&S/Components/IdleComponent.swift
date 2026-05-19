// IdleComponent.swift
import SpriteKit
import GameplayKit

class IdleComponent: GKComponent {
    var actionName: String!

    static func make(actionName: String) -> IdleComponent {
        let component = IdleComponent()
        component.actionName = actionName
        return component
    }

    func start() {
        guard let sprite = entity?.component(ofType: SpriteComponent.self),
              let action = SKAction(named: actionName) else { return }
        sprite.node.run(.repeatForever(action), withKey: "idle")
    }
}

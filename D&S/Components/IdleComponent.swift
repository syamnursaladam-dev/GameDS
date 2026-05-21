// IdleComponent.swift
import SpriteKit
import GameplayKit

class IdleComponent: GKComponent {
    var actionName: String!
    // MARK: Initiate Component

    static func make(actionName: String) -> IdleComponent {
        let component = IdleComponent()
        component.actionName = actionName
        return component
    }
    // MARK: Func idle

    func start() {
        guard let sprite = entity?.component(ofType: SpriteComponent.self),
              let action = SKAction(named: actionName) else { return }
        sprite.node.run(.repeatForever(action), withKey: "idle")
    }
}

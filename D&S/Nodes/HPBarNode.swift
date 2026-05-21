//
//  HPBarNode.swift
//  D&S
//

import SpriteKit
import GameplayKit

class HPBarNode: SKNode {

    var background: SKSpriteNode!
    var fill: SKSpriteNode!

    // MARK: HP Node
    private static func build() -> HPBarNode {
        let node = HPBarNode()

        node.background = SKSpriteNode(color: .darkGray, size: CGSize(width: 100, height: 12))
        node.background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.addChild(node.background)

        node.fill = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 12))
        node.fill.anchorPoint = CGPoint(x: 0, y: 0.5)
        node.fill.position = CGPoint(x: -50, y: 0)
        node.addChild(node.fill)

        return node
    }

    // MARK: Initiate GameScene
    static func make(from nodeName: String, in scene: SKScene, entity: GKEntity?) -> HPBarNode? {
        guard let hpNode = scene.childNode(withName: "//\(nodeName)") as? SKSpriteNode,
              let health = entity?.component(ofType: HealthComponent.self) else { return nil }

        let bar = HPBarNode.build()
        hpNode.isHidden = true
        bar.position = scene.convert(.zero, from: hpNode)
        bar.zPosition = hpNode.zPosition
        scene.addChild(bar)
        bar.update(health: health)
        return bar
    }

    // MARK: HP Visual Status
    func update(health: HealthComponent) {
        fill.xScale = health.hpPercent

        if health.hpPercent > 0.5 {
            fill.color = .green
        } else if health.hpPercent > 0.25 {
            fill.color = .yellow
        } else {
            fill.color = .red
        }
    }
}

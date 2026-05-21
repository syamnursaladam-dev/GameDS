//
//  HPBarNode.swift
//  D&S
//

import SpriteKit

class HPBarNode: SKNode {

    var background: SKSpriteNode!
    var fill: SKSpriteNode!

    static func make() -> HPBarNode {
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

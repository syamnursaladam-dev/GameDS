//
//  AttackNode.swift
//  D&S
//
//  Created by Adam Syam Nursal on 25/05/26.
//

import SpriteKit
import GameplayKit

class AtkBarNode: SKNode {

    private var badge: SKShapeNode!
    private var iconLabel: SKLabelNode!
    private var numberLabel: SKLabelNode!

    // MARK: Build Shape
    private static func build() -> AtkBarNode {
        let node = AtkBarNode()

        // Rounded rectangle badge background
        node.badge = SKShapeNode(rectOf: CGSize(width: 60, height: 28), cornerRadius: 8)
        node.badge.fillColor = UIColor(red: 0.8, green: 0.2, blue: 0.1, alpha: 1.0)
        node.badge.strokeColor = UIColor(red: 1.0, green: 0.5, blue: 0.2, alpha: 1.0)
        node.badge.lineWidth = 2
        node.addChild(node.badge)

        // "ATK" icon label on the left
        node.iconLabel = SKLabelNode(text: "ATK")
        node.iconLabel.fontName = "AvenirNext-Bold"
        node.iconLabel.fontSize = 8
        node.iconLabel.fontColor = UIColor(white: 1.0, alpha: 0.7)
        node.iconLabel.horizontalAlignmentMode = .left
        node.iconLabel.verticalAlignmentMode = .center
        node.iconLabel.position = CGPoint(x: -26, y: 0)
        node.addChild(node.iconLabel)

        // Attack number label on the right
        node.numberLabel = SKLabelNode(text: "0")
        node.numberLabel.fontName = "AvenirNext-Bold"
        node.numberLabel.fontSize = 16
        node.numberLabel.fontColor = .white
        node.numberLabel.horizontalAlignmentMode = .right
        node.numberLabel.verticalAlignmentMode = .center
        node.numberLabel.position = CGPoint(x: 26, y: 0)
        node.addChild(node.numberLabel)

        return node
    }

    // MARK: Initiate in GameScene
    static func make(from nodeName: String, in scene: SKScene, entity: GKEntity?) -> AtkBarNode? {
        guard let atkNode = scene.childNode(withName: "//\(nodeName)"),
              let atk = entity?.component(ofType: AttackComponent.self) else { return nil }

        let bar = AtkBarNode.build()
        atkNode.isHidden = true
        bar.position = scene.convert(.zero, from: atkNode)
        bar.zPosition = atkNode.zPosition
        scene.addChild(bar)
        bar.update(atk: atk.stat.atk)
        return bar
    }
//    static func make(from nodeName: String, in scene: SKScene, entity: GKEntity?) -> HPBarNode? {
//        guard let hpNode = scene.childNode(withName: "//\(nodeName)") as? SKSpriteNode,
//              let health = entity?.component(ofType: HealthComponent.self) else { return nil }
//
//        let bar = HPBarNode.build()
//        hpNode.isHidden = true
//        bar.position = scene.convert(.zero, from: hpNode)
//        bar.zPosition = hpNode.zPosition
//        scene.addChild(bar)
//        bar.update(health: health)
//        return bar
//    }

    // MARK: Update Attack Number
    func update(atk: Int) {
        numberLabel.text = "\(atk)"
    }
}


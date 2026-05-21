//
//  HealthComponent.swift
//  D&S
//
//  Created by Adam Syam Nursal on 21/05/26.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
    
    var stats: CharacterStats!

    var isDead: Bool {
        return stats.hp <= 0
    }

    var hpPercent: CGFloat {
        return CGFloat(stats.hp) / CGFloat(stats.maxHp)
    }
    // MARK: Initiate component

    static func make(stats: CharacterStats) -> HealthComponent {
        let component = HealthComponent()
        component.stats = stats
        print("Hello")
        return component
    }
}

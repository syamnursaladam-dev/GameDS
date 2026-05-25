//
//  AttackNode.swift
//  D&S
//
//  Created by Adam Syam Nursal on 25/05/26.
//

import SpriteKit
import GameplayKit

class AttackComponent: GKComponent {
    // MARK: Initiate Component
    var stat : CharacterStats!
    
    static func make(stats : CharacterStats) -> AttackComponent {
        let component = AttackComponent()
        component.stat = stats
        return component
    }
    
    
}

//static func make(actionName: String) -> IdleComponent {
//    let component = IdleComponent()
//    component.actionName = actionName
//    return component
//}

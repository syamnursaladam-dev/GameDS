// GameScene.swift
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var hero: HeroEntity!
    var slotmachine: [SlotEntity] = []
    var hpBar: HPBarNode!

    override func didMove(to view: SKView) {
        hero = HeroEntity.make(from: "Player", in: self)
        slotmachine = SlotEntity.makeAll(from: "Slot", count: 3, in: self)
        hpBar = HPBarNode.make(from: "Player_Hp", in: self, entity: hero)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spinAllSlots()
    }
    
    // MARK: Func Spin Slot
    func spinAllSlots() {
        for (i, slot) in slotmachine.enumerated() {
            let spin = slot.component(ofType: SpinComponent.self)
            spin?.spin()
            print("Slot \(i + 1): \(spin?.currentElement.rawValue ?? "nil")")
        }
    }
}

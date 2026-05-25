// GameScene.swift
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var hero: HeroEntity!
    var slotmachine: [SlotEntity] = []
    var hpBar: HPBarNode!
    var atkBar : AtkBarNode!

    override func didMove(to view: SKView) {
        hero = HeroEntity.make(from: "Player", in: self)
        slotmachine = SlotEntity.makeAll(from: "Slot", count: 3, in: self)
        hpBar = HPBarNode.make(from: "Player_Hp", in: self, entity: hero)
        atkBar = AtkBarNode.make(from: "Float_Damage", in: self, entity: hero)
    }

    // MARK: Func Spin Slot
    func spinAllSlots() {
        for (_, slot) in slotmachine.enumerated() {
            let spin = slot.component(ofType: SpinComponent.self)
            spin?.spin()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spinAllSlots()
    }
}

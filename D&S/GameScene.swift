// GameScene.swift
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var hero: HeroEntity!
    var slot: SlotEntity!
    var slotmachine :[SlotEntity] = []
    var hpBar: HPBarNode!
    
    override func didMove(to view: SKView) {
        setuphero()
        setupslot()
        setupHpBar()
    }
    
    func setuphero() {
        guard let node = childNode(withName: "//Player") as? SKSpriteNode else {
            print("Player node not found")
            return
        }
        hero = HeroEntity.make(node: node)
        hero.component(ofType: IdleComponent.self)?.start()
    }
    
    func setupslot(){
        for i in 1...3{
            guard let node = childNode(withName: "//Slot_\(i)") as? SKSpriteNode else {
                print("Slot_\(i) node not found")
                return
            }
            slot = SlotEntity.setup(node: node)
            slotmachine.append(slot)
        }
    }
    
    func spinallstol(){
        for (i, slot) in slotmachine.enumerated() {
            let spin = slot.component(ofType: SpinComponent.self)
            spin?.spin()
            print("Slot \(i + 1): \(spin?.currentElement.rawValue ?? "nil")")
        }
    }
    
    func setupHpBar() {
        guard let hpNode = childNode(withName: "//Player_Hp") as? SKSpriteNode else {return}
        guard let health = hero.component(ofType: HealthComponent.self) else {return}
        
        hpNode.isHidden = true
        hpBar = HPBarNode.make()
        hpBar.position = convert(.zero, from: hpNode)
        hpBar.zPosition = hpNode.zPosition
        addChild(hpBar)
        hpBar.update(health: health)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spinallstol()
    }
}

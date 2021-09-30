protocol AdvancedLifeSupport{
    func performCPR()
}

class EmergencyCallHandler{
    var delegate : AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport{
    
    init(handler : EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compression, 30 per second.")
    }
}

class Doctor : AdvancedLifeSupport{
    
    init(handler : EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compression, 90 per second.")
    }
    
    func useStethescope(){
        print("Listening for heart sounds.")
    }
    
}

class Surgeon : Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
    
}


let _handler = EmergencyCallHandler()
let _paramedic = Paramedic(handler: _handler)

_handler.assessSituation()
_handler.medicalEmergency()

let _surgeon = Surgeon(handler: _handler)


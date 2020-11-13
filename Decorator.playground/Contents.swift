import UIKit

///Decorator Design Pattern main functions:
///attain to the O of SOLID, Open for extension, close for modification
///to extend the codebase, to compose an object
///all these at runtime

///with out Decorator design pattern you would have to keep on modifying this Computer_ object!

//class Computer_ {
//
//    func description(){
//        //print("Computer")
//        //print("Computer with external HDD")
//        print("Computer with external HDD and a High Definition Monitor")
//    }
//}

//let computer : Computer_ = Computer_()
//computer.description()

///so if you want to add an external HDD
///or High Definition Monitor, you need to constanly modify your main component
///thus, this violates O in SOLID

///Best approach

//create a component
protocol Component{
    func description() -> String
}

//this is going the bucket where I drop my decoration components.
enum Components : String{
    case Computer = "my computer "
    case ExternalHDD = "with an External Hard Disk Drive "
    case Monitor = "and a 24 inche monitor "
}

//lets create my main component now, this component will be wrapped by other decorator components
class Computer : Component{
    func description() -> String {
        return Components.Computer.rawValue
    }
}

//now we create my decorator class
//notice that the decorator subscribes to the Dependency Inversion definition in SOLID
//also, notice that the decorator is really a wrapper...it's going to wrap components!
protocol Decorator : Component{
    var component : Component { get }
}


//first decorator is going to be an external HDD
class ExternalHDD : Decorator{
    var component: Component
    
    init(component: Component) {
        self.component = component
    }
    
    func description() -> String {
        return  component.description() + Components.ExternalHDD.rawValue
    }
}

//another decorator, we can use a struct too
struct Monitor : Decorator{
    var component: Component
    
    func description() -> String {
        return component.description() + Components.Monitor.rawValue
    }
}

//you can include or exclude decorator items with no problem
//just keep your main component, in this case the Computer.

var myComputer : Component = Computer()
//myComputer = ExternalHDD(component: myComputer)
//myComputer = Monitor(component: myComputer)


print(myComputer.description())

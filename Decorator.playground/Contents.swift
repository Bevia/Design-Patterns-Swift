import UIKit

///Decorator Design Pattern main functions:
///conforms to the O of SOLID, Open for extension, close for modification
///to extend the codebase, to compose an object at runtime

///with out Decorator design pattern you would have to keep on modifying this Computer_ object!

///so if you want to add an external HDD
///or High Definition Monitor, you need to constanly modify your main component
///thus, this violates O in SOLID

///Best approach

//create a abstract component
protocol Computer{
    func description() -> String
    func price() -> Int
}

//lets create my main component now, this component will be wrapped by other decorator components
class BrandAComputer : Computer{
   
    func description() -> String {
        //return Components.Computer.rawValue
        return "Brand A Computer"
    }
    
    func price() -> Int {
        return 1000
    }
}

class ComputerDecorator : Computer{
    
    //The computer instance is use to forward request to the concrete computer object
    let computer : Computer
    
    init(computer : Computer) {
        self.computer = computer
    }
    
    
    func description() -> String {
        return computer.description()
    }
    
    func price() -> Int {
        computer.price()
    }
    
}


//first decorator is going to be an external HDD
class ExternalHDD : ComputerDecorator{
    override func description() -> String {
        return computer.description() + " with an external HDD"
    }
    
    override func price() -> Int {
        computer.price() + 500
    }
    
}


class Monitor : ComputerDecorator{
    override func description() -> String {
        return computer.description() + " and a 23 inch monitor"
    }
    
    override func price() -> Int {
        computer.price() + 280
    }
    
}

//you can recursively include or exclude decorator items.
//just keep your main component, which is been wrapped, in this case the Computer.

var myComputer : Computer = BrandAComputer()
//myComputer = ExternalHDD(computer : myComputer)
myComputer = Monitor(computer: myComputer)
print("\(myComputer.description()) and a price of \(myComputer.price())" )

///we can now add another component:


class BrandBComputer : Computer{
    func description() -> String {
        //return Components.Computer.rawValue
        return "Brand B Computer"
    }
    
    func price() -> Int {
        return 2200
    }
}

//and use the decorators already in place, or you can extend it even more.
myComputer = BrandBComputer()
//myComputer = ExternalHDD(computer : myComputer)
myComputer = Monitor(computer: myComputer)
print("\(myComputer.description()) and a price of \(myComputer.price())" )

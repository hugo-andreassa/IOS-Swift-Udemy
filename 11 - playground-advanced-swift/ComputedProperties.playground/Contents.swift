import Foundation

var pizzaInInches: Int = 10 {
    willSet {
        // Old Value
        print(pizzaInInches)
        print(newValue)
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size, pizza inches set to 18")
            pizzaInInches = 18
        }
    }
}

var numberOfPeople: Int = 6
let slicesPerPerson: Int = 4

// Computed Property
var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
//    set {
//        print("numberOsSlices now has a new value which is \(newValue)")
//    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeoplePerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeoplePerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

// Computed
print(numberOfSlices)
print(numberOfPizza)

numberOfPizza = 4

print(numberOfPeople)

// Observable
pizzaInInches = 28

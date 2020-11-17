import UIKit

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee : Coffee {
    var cost: Int {
        return 100
    }
}

protocol CoffeeDecorator : Coffee {
    var base: Coffee { get }
    
    init (base: Coffee )
}

class Milk : CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 20
    }
    
    required init (base: Coffee ) {
        self .base = base
    }
}

class Whip : CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 10
    }
    
    required init (base: Coffee ) {
        self .base = base
    }
}

class Sugar : CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 5
    }
    
    required init (base: Coffee ) {
        self .base = base
    }
}

let coffee = SimpleCoffee ()

let coffeeWithMilk = Milk (base: coffee)

let coffeeWithMilkAndWhip1 = Whip (base: coffeeWithMilk)
let coffeeWithMilkAndWhip2 = Whip (base: Milk (base: coffee))

let coffeeWithMilkAndWhipAndSugar = Sugar (base: coffeeWithMilkAndWhip1)

print(coffee.cost) // 100
print(coffeeWithMilk.cost) // 120
print(coffeeWithMilkAndWhip1.cost) // 130
print(coffeeWithMilkAndWhip2.cost) // 130
print(coffeeWithMilkAndWhipAndSugar.cost) // 135


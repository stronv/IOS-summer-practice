//Необходимо использовать разные модификаторы доступа.

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func takeTheBook(person: Person) {}
    func returnTheBook(person: Person) {}
}

protocol payMoney {
    func PayMoney(who: Person, amount: Int)
}

class Reader: Person, payMoney {
    func PayMoney(who: Person, amount: Int) {
        print("\(who.name) paid \(amount) for the book")
    }
    
    override func takeTheBook(person: Person) {
        print("\(person.name) take the book!")
    }
    override func returnTheBook(person: Person) {
        print("\(person.name) return the book!")
    }
}

protocol countingOfBooks {
    func numberOfBooks(whoCounting: Librarian, numberOfBooks: Int)
}

class Librarian: Person, countingOfBooks {
    override func takeTheBook(person: Person) {
        print("\(person.name) take the book back!")
    }
    override func returnTheBook(person: Person) {
        print("\(person.name) give the book back!")
    }
    
    func numberOfBooks(whoCounting: Librarian, numberOfBooks: Int) {
        if numberOfBooks > 3 {
            print("\(whoCounting.name) says: I can give only 3 books!")
        }
        if numberOfBooks <= 0 {
            print("\(whoCounting.name) says: Are you kiding me?")
        }
    }
}

class Guardian {
    let name: String
    
    init (name: String) {
        self.name = name
    }
}

enum WeekDays {
    case WorkingDays // = "We are working from 9:00 to 15:00!"
    case WeekendDays // = "We are working from 8:00 to 17:00!"
}


struct Room {
    let nameOfRoom: String
    internal func check(FreeNumberOfSeets: Int, guardian: Guardian) {
        if FreeNumberOfSeets >= 3 {
            print("\(guardian.name) says: You are welcome!")
        }
        else {
            print("\(guardian.name) says: Wait, please!")
        }
    }
    internal func checkTheDate(day: WeekDays) {
        if day == .WeekendDays {
            print("We are working from 8:00 to 17:00!")
        }
        else {
            print("You can read from 9:00 to 19:00!")
        }
    }
}

enum NumberOfChillers {
    case ALotOfChillers
    case MediumNumberOfChillers
    case SmallNumberOfChillers
}

class Gazing: Guardian {

    func CheckingChillingRoom(Chillers: NumberOfChillers, smotryashyi: Gazing) {
        if Chillers == .ALotOfChillers {
            print("\(smotryashyi.name) says: Guys, be quiet, please")
        }
        if Chillers == .MediumNumberOfChillers {
            print("\(smotryashyi.name) says: Remember the rule: Don't make loud noise!")
        }
        if Chillers == .SmallNumberOfChillers {
            print("\(smotryashyi.name) says: How nice it is when there are few people))")
        }
    }
}

struct Bufet {
    struct someEat {
        let nameOfProduct: String
    }
    struct Cooker {
        let name: String
    }
    internal func cookerGiveFood(giver: Cooker, taker: Person, eat: someEat) {
        print("\(giver.name) give \(eat.nameOfProduct) to \(taker.name)")
    }
}

var test = Reader(name: "Ivan")
test.returnTheBook(person: test)
test.PayMoney(who: test, amount: 100)
var library = Room(nameOfRoom:"Library")

var guardian = Guardian(name: "Mihalych")

library.check(FreeNumberOfSeets: 3, guardian: guardian)
library.checkTheDate(day: .WorkingDays)

var Gazer = Gazing(name: "Petr")
Gazer.CheckingChillingRoom(Chillers: .MediumNumberOfChillers, smotryashyi: Gazer)

var bufet = Bufet()

var antonio = Bufet.Cooker(name: "Antonio")

bufet.cookerGiveFood(giver: antonio, taker: test, eat: Bufet.someEat.init(nameOfProduct: "Wok"))

var fisa = Librarian(name: "Fisa")

fisa.numberOfBooks(whoCounting: fisa, numberOfBooks: 17)

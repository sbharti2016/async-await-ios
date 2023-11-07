import Foundation

// Data Source
enum Level: String, CaseIterable {
    
    case engineer
    case seniorEngineer
    case manager
    case seniorManager
    case director
    case ceo
    
    var salary: Double {
        switch self {
        case .engineer: return 100000.0
        case .seniorEngineer: return 200000.0
        case .manager: return 300000.0
        case .seniorManager: return 400000.0
        case .director: return 500000.0
        case .ceo: return 900000.0
        }
    }
}


// Async/await approach

// Declaring an async function
func fetchLevels() async -> [Level] {
    let sleepTime = UInt32.random(in: 2...5)
    print("Pretending: Fetching Levels will take: \(sleepTime) seconds")
    sleep(sleepTime)
    return Level.allCases
}

// Declaring an async function
func retrieveSalaryFor(tier: Level) async -> Double {
    let sleepTime = UInt32.random(in: 2...5)
    print("Pretending: Fetching salary info will take: \(sleepTime) seconds")
    sleep(sleepTime)
    return tier.salary
}

// Calling an async function
let levels = await fetchLevels()

for currentLevel in levels {
    // Calling an async function
    let salary = await retrieveSalaryFor(tier: currentLevel)
    print("Salary tier for \(currentLevel.rawValue) = \(salary)")
}


// Via closures

func fetchLevels(completionHandler: ([Level]) -> Void) {
    testAPICall()
    completionHandler(Level.allCases)
}

func retrieveSalaryFor(tier: Level, completionHandler: (Double) -> Void) {
    testAPICall()
    completionHandler(tier.salary)
}

func testAPICall() {
    let sleepTime = UInt32.random(in: 2...5)
    print("Pretending: Fetching Levels will take: \(sleepTime) seconds")
    sleep(sleepTime)
}

fetchLevels { levels in
    print("Levels information: ", levels)
    
    for currentLevel in levels {
        retrieveSalaryFor(tier: currentLevel) { salary in
            print("Salary tier for \(currentLevel.rawValue) = \(salary)")
        }
    }
}


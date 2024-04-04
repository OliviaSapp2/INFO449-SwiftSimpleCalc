//: # Welcome to the UW Calculator Playground (Simple Version)
//:
print("Welcome to the UW Calculator Playground")
//: This homework is designed to force you to exercise your knowledge of the Swift programming language. This homework does not involve iOS in any way. It uses the Playground feature of XCode to allow you to interactively write Swift code--the compiler will constantly check your code in the background.
//:
//: In this exercise, you will implement a pair of functions that do some simple mathematical calculations.
//:
//: ## Your tasks
//: You are to implement two `calculate` functions, each of which take `Strings` that must be converted to integer values in order to perform the calculations intended. This is designed to make you comfortable with converting Strings to other values--a common task in mobile applications, when obtaining input from the user--for further processing. One of the functions takes an array of Strings, expecting each "part" of the calculation expression to be each be in its own String (such as "2" "+" "2"), and the second expects a single String containing the entire expression ("2 + 2").
//: 
//: You should make sure your calculate method can handle the following kinds of input:
//: 
//: * `calculate(["2", "+", "2"])`: This should return 2+2, or 4
//: * `calculate(["2", "-", "2"])`: This should return 2-2, or 0
//: * `calculate(["2", "*", "2"])`: This should return 2*2, or 4
//: * `calculate(["2", "/", "2"])`: This should return 2/2, or 1
//: * `calculate(["2", "%", "2"])`: This should return 2%2, or 0
//: 
//: > For those who aren't aware of it, the "%" operator is called the "modulo" operator, and it is the "remainder" result in an integer division that does not divide equally. Thus, `5 % 2` is 1 (5 divided by 2 is 2 remainder 1), `10 % 3` is 1 (10 divided by 3 is 3 remainder 1) and `4 % 2` is 0 (4 divided by 2 is 2 remainder 0).
//: 
//: The `calculate` method also needs to support a few other less-traditional expressions as well:
//: 
//: * `calculate(["1", "2", "3", "4", "5", "count"])`: This should return a count of all the number arguments, which in this case will be 5.
//: * `calculate(["1", "3", "2", "avg"])`: This should return the average of the numbers, which is all of the values added up (1 + 3 + 2) and divided by the number of arguments (3).
//: * `calculate(["5", "fact"])`: This should calculate the factorial of the single number passed in, which is that number multiplied by each number below it. 5-factorial is 5 * 4 * 3 * 2 * 1, or 120.
//: 
//: For this latter set of operations, it is safe to assume that `["count"]` (with no additional arguments) is 0, `["avg"]` is also 0, and `["fact"]` is 0. `["1", "fact"]` should return 1, and `["0", "fact"]` should also return 1. (Yes, 0-factorial is 1. True story.)
//: 
/* One of the functions takes an array of Strings, expecting each "part" of the calculation expression to be each be in its own String (such as "2" "+" "2"),
 */

func calculate(_ args: [String]) -> Int {
    // edge cases, if the array has only 1 element
    let length = args.count
    if length == 1{
        return 0;
    }
    //ADD
     else if args.contains("+"){
        let left = Int(args[0])! //turns the 0th element.string into an int
        let right = Int(args[2])! //turns the second element.string into an int
        var total = left + right
        return total
    }
    //SUBTRACT
    else if args.contains("-"){
        let left = Int(args[0])!
        let right = Int(args[2])!
        var total = left - right
        return total
    }
    //MULTIPLY
    else if args.contains("*"){
        let left = Int(args[0])!
        let right = Int(args[2])!
        var total = left * right
        return total
    }
    //DIVIDE
    else if args.contains("/"){
        let left = Int(args[0])!
        let right = Int(args[2])!
        var total = left / right
        return total
    }
    //MOD
    else if args[1].contains("%"){
        let left = Int(args[0])!
        let right = Int(args[2])!
        var total = left % right
        return total
    }
    //COUNT
    else if args.contains("count"){
        let length = args.count // length of the array
        var total = length - 1 // the length of the array without the last emelemt "count"
        return total
    }
    //Average
    else if args.contains("avg"){
        var newArray = args
        newArray.removeLast() //removes "avg" from the array
        let intArray = newArray.map {Int($0)!} //turns the array of strings into an array of ints
        var total = 0
        var last = intArray.count
        last = last - 1
        for i in 0 ... last{ //adds up all the ints
            total = total + intArray[i]
        }
        var avg = total / intArray.count
        return avg
    }
    //FACTORIAL
    else if args.contains("fact"){
        let num = Int(args[0])!
        if num == 1 || num == 0 { //if the number is 1 or 0 the factorial is 1
            return 1
        } else {
            var total = 1
            for i in 1 ... num{
                total = total * i
            }
            return total
        }
    }
    else {
        return -1
    }
}


func calculate(_ arg: String) -> Int {
    if (!arg.contains(" ")){ //edge case string has no spaces so no function takes place
        return 0
    }
    //ADD
    else if arg.contains("+"){
        var tempArray = Array(arg) //turns string into array of strings
        let left = Int(String(tempArray[0]))! //turns element from a stringinto an int
        let right = Int(String(tempArray[4]))!
        var total = left + right
        return total
    }
    //SUBTRACT
    else if arg.contains("-"){
        var tempArray = Array(arg)
        let left = Int(String(tempArray[0]))!
        let right = Int(String(tempArray[4]))!
        var total = left - right
        return total
    }
    //MULTIPLY
    else if arg.contains("*"){
        var tempArray = Array(arg)
        let left = Int(String(tempArray[0]))!
        let right = Int(String(tempArray[4]))!
        var total = left * right
        return total
    }
    //DIVIDE
    else if arg.contains("/"){
        var tempArray = Array(arg)
        let left = Int(String(tempArray[0]))!
        let right = Int(String(tempArray[4]))!
        var total = left / right
        return total
    }
    //MOD
    else if arg.contains("%"){
        var tempArray = Array(arg)
        let left = Int(String(tempArray[0]))!
        let right = Int(String(tempArray[4]))!
        var total = left % right
        return total
    }
    //COUNT
    else if arg.contains("count"){
        var tempString = arg
        var noSpaces = Array(tempString.filter{!$0.isWhitespace }) // remove spaces and turn it into an array
        noSpaces.removeLast(5) // remove "count"
        let length = noSpaces.count // length of the array
        return length
    }
//    //AVERAGE
    else if arg.contains("avg"){
        var tempString = arg
        var noSpaces = Array(tempString.filter{!$0.isWhitespace }) // remove spaces and turn it into an array
        noSpaces.removeLast(3) // remove "avg"
        
        var end = (noSpaces.count) - 1
        var total = 0
        for i in 0 ... end{ // loop through array and add numbers
            total = total + Int(String(noSpaces[i]))!
        }
        var avg = total / noSpaces.count
        return avg
   }
    //FACTORIAL
    else if arg.contains("fact"){
        var stringArray = Array(arg)
        let num = Int(String(stringArray[0]))!
        if num == 1 || num == 0 { //if the number is 1 or 0 the factorial is 1
            return 1
        } else {
            var total = 1
            for i in 1 ... num {
                total = total * i
            }
            return total
        }
    }
    else{
        return -1
    }
}
//: Below this are the test expressions/calls to verify if your code is correct.
//:
//: ***DO NOT MODIFY ANYTHING BELOW THIS***
//: -------------------------------------------
//: All of these expressions should return true
//: if you have implemented `calculate()` correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

//: -------------------------------------------
//: These are extra credit tests; they are commented out 
//: so that they do not conflict with you work until you 
//: choose to implement them.
//: Uncomment them to turn them on for evaluation.
//:
//: Implement `calculate([String])` and `calculate(String)` to handle negative numbers. You need only make the tests below pass. (You do not need to worry about "fact"/factorial with negative numbers, for example.)
//:
//: This is worth 1 pt
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
//: Implement `calculate([String])` and `calculate(String)` to use 
//: and return floating-point values. You need only make the tests 
//: below pass. (Factorial of floating-point numbers doesn't make 
//: much sense, either.)
//:
//: Swift *will* allow you to overload based on return types, so 
//: the below functions can co-exist simultaneously with the 
//: Integer-based versions above.
//: 
//: This is worth 1 pt
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
*/

# Import readline and math modules
readline = require 'readline'
math = require 'mathjs'

# Create an interface for reading data from the user
rl = readline.createInterface
  input: process.stdin
  output: process.stdout

# Define functions for arithmetic operations
add = (a, b) -> a + b
subtract = (a, b) -> a - b
multiply = (a, b) -> a * b
divide = (a, b) ->
  if b != 0 then a / b else "Cannot divide by zero"

exponent = (a, b) -> Math.pow(a, b)
square = (a) -> a * a
squareRoot = (a) -> Math.sqrt(a)
nthRoot = (a, n) -> Math.pow(a, 1 / n)
logBase10 = (a) -> Math.log10(a)
logBase2 = (a) -> Math.log2(a)

# Function to convert decimal to fraction
# decimalToFraction = (decimal) ->
#   fraction = math.fraction(decimal)
#   "#{fraction.n}/${fraction.d}"

# Function to prompt the user and perform calculations
calculate = ->
  rl.question "Enter first number: ", (num1) ->
    num1 = parseFloat(num1)
    rl.question "Enter second number (if needed): ", (num2) ->
      num2 = parseFloat(num2)
      rl.question "Enter operation (+, -, *, /, ^, sq, sqrt, nthroot, log10, log2): ", (operation) ->
        result = switch operation
          when "+" then add(num1, num2)
          when "-" then subtract(num1, num2)
          when "*" then multiply(num1, num2)
          when "/" then divide(num1, num2)
          when "^" then exponent(num1, num2)
          when "sq" then square(num1)
          when "sqrt" then squareRoot(num1)
          when "nthroot" then nthRoot(num1, num2)
          when "log10" then logBase10(num1)
          when "log2" then logBase2(num1)
        #   when "frac" then decimalToFraction(num1)
          else "Invalid operation"
        console.log "The result is: #{result}"
        rl.close()

# Start the calculator
calculate()

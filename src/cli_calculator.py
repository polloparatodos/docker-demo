import sys

QUIT = False

print("Please provide a valid option: \n",
      "    a. Addition \n",
      "    s. Subtraction \n",
      "    d. Division \n",
      "    m. Multiplication \n",
      "    q. Quit")
math_method = input("Welcome to CLI Calculator Choose an above option to select a mathematical method: ")
if math_method.lower() == "q":
    print("Thanks for using CLI Calculator!")
    sys.exit(0)

use_counter = 0

while True:

    while math_method.lower() not in  ["a","s","d","m","q"]:
        print("Please provide a valid option: \n",
          "    a. Addition \n",
          "    s. Subtraction \n",
          "    d. Division \n",
          "    m. Multiplication \n",
          "    q. Quit")
        math_method = input("Choose an above option to select a mathematical method: ")

    if math_method == "q":
        print("Thanks for using CLI Calculator!")
        sys.exit(0)

    computation_numbers = input("Enter two numbers separated by a comma (,): ")
    clean_input = "".join([i for i in computation_numbers if i.isnumeric() or i == ","])

    while len(computation_numbers.split(",")) != 2:
        computation_numbers = input("Enter two numbers separated by a comma (,): ")

    computation_numbers = [int(i.strip()) for i in computation_numbers.split(",") if i.isnumeric() == True]


    if math_method == "a":
        result = computation_numbers[0]
        for i in computation_numbers[1:]:
            result += i
    elif math_method == "s":
        result = computation_numbers[0]
        for i in computation_numbers[1:]:
            result -= i
    elif math_method == "m":
        result = computation_numbers[0]
        for i in computation_numbers[1:]:
            result *= i
    elif math_method == "d":
        result = computation_numbers[0]
        for i in computation_numbers[1:]:
            result /= i

    use_counter += 1
    print (f"Result: {result}")
    math_method = ""

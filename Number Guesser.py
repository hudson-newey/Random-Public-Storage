import random

#initialization
favNumber = 0
generations = 0
dialationFactor = 100

print("\nPick a number between 1 and 100000,")
number = int(input())
while True:
    generations += 1

    if number > 100000:
        continue

    if (favNumber == 0):
        guess = random.randint(-1,100000)
        print("my guess is", guess)
    else:
        print(favNumber)

    if number < favNumber:
        favNumber -= (1 * (dialationFactor / generations))
    elif number > favNumber:
        favNumber += (1 * (dialationFactor / generations))

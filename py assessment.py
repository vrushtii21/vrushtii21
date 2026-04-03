f1 = open("fruits.txt","a")
print("Welcome to the Fruit Market  \n 1.manager \n 2.customer")
role = input("Enter your role: ")
if role == "1":
    fruits = {}

    while True:
        print("\nManager Menu")
        print("1. Add Fruit Stock")
        print("2. View Fruits Stock")
        print("3. Update Fruit Stock")
        choice = input("Enter your choice: ")
        if choice == "1":
            name = input("Enter fruit name: ")
            qty = int(input("Enter quantity: "))
            price = int(input("Enter price: "))
            fruits[name] = [qty, price]
            print("Fruit Stock Added Successfully")
            f1.write(f"{name},{qty},{price}\n")
        elif choice == "2":
            if fruits:
                print("\nFruits Stock:")
                for fruit, details in fruits.items():
                    print(f"{fruit}: Quantity={details[0]}, Price={details[1]}")
            else:
                print("No fruits in stock.")
        elif choice == "3":
            name = input("Enter fruit name to update: ")
            if name in fruits:
                qty = int(input("Enter new quantity: "))
                price = int(input("Enter new price: "))
                fruits[name] = [qty, price]
                f1.write(f"{name},{qty},{price}\n")
                print("Fruit Stock Updated Successfully")
            else:
                print("Fruit not found in stock.")
        else:
            print("Invalid choice. Please try again.")

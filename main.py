import Purchase

purchase = Purchase.Purchase()
user = input("Enter username:\n").rstrip()
passwrd = input("Enter password:\n").rstrip()
if(purchase.validateUsernamePassword("userpass.xml",user,passwrd)):
    print("Login Successful")
    while (True):
        print("1. Purchase Item\n2. Exit")
        choice = int(input("Enter your choice:\n"))
        if choice==1:
            purchaseList=[]
            while(True):
                itemNo = int(input("Enter item number:\n"))
                if(purchase.checkItemPresent("item.xml",itemNo)):
                    quant = int(input("Enter quantity of item:\n"))
                    purchasedItem = purchase.purchaseItem("item.xml",user,itemNo,quant)
                    if len(purchasedItem)!=0:
                        purchaseList.append(purchasedItem)
                    yn = input("Do you want to add one more item?(Yes/No):\n").rstrip()
                    if yn != "Yes" and yn != "yes":
                        break
                else:
                    print("Item not present")
        	
            purchase.printPurchasedItems(purchaseList)
            cost = purchase.calculateAmount(purchaseList)
            print("Total cost = "+str(cost))
        else:
            break
        
	

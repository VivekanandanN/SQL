import xml.etree.ElementTree as ET
import csv
import operator
from datetime import datetime
import time
import sys

from xml.etree import ElementTree as etree


class Purchase:
    def printPurchasedItems(self, purchaseList):
        print("Item No  Name  Quant  Cost")
        for i in purchaseList:
            for j in i:
                print(j, end=" ")
            print("\n")

    def checkItemPresent(self, itemFile, itemNo):
        tree = ET.parse(itemFile)    
        root = tree.getroot()
        for att in root.findall('item'):
            stritem = att.find('itemNo').text
            if (int(stritem) == itemNo):
                strReturn = True
        if strReturn:
            return True
        else:
            return False

    def purchaseItem(self, itemFile, username, itemNo, quant):
        # ---Fill your code here------#
        tree = etree.parse(itemFile)
        root = tree.getroot()
        strList = []
        for att in root.findall('item'):
            stritem = att.find('itemNo').text
            if (int(stritem) == itemNo):
                stritem = att.find('itemNo').text
                strname = att.find('name').text
                strquantity = att.find('quantity').text
                strprice = att.find('cost').text
                if int(strquantity) <= quant:
                    strList.append(stritem)
                    strList.append(strname)
                    strList.append(int(strquantity))
                    strList.append(int(strprice))
    
        if len(strList) > 0:
            return strList
        else:
            print("The required quantity is not available")
            return strList
    
    
    def calculateAmount(self, purchaseList):
        # ---Fill your code here-------#
        return int(purchaseList[2]) * int(purchaseList[3])
    
    
    def validateUsernamePassword(self, userFile, user, passwrd):
        # ---Fill your code here-------
        tree = etree.parse(userFile)
        root = tree.getroot()
        strReturn = ""
        for att in root.findall('user'):
            struser = att.find('username').text
            strpwd = att.find('password').text
            if (struser == user) and (strpwd == passwrd):
                strReturn = True
    
        if strReturn:
            print("Login Successful")
            return True
        else:
            print("Invalid Username and Password")
            return False
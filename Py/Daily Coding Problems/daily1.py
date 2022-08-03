# Daily coding problem 1
# Given a list of numbers, return whether any two sums to k. For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
# Bonus: Can you do this in one pass?
import array as arr

#Function to check if there is a match
def checkmatch( numList, k ):
    auxNumList = set()

    for item in numList:
        tmpSum = k - item
        if tmpSum in auxNumList:
            return True
        auxNumList.add(item)

    return False

if __name__ == "__main__":

    print("######################")
    print("DAILY CODING PROBLEM 1")
    print("######################\n")

    numListTest1 = arr.array('i', [10,15,3,7])
    kTest1 = 17

    print("## TEST 1 ##") 
    if checkmatch(numListTest1, kTest1):
        print ("There is a match\n")
    else:
        print ("There is no match\n")

        
    numListTest2 = arr.array('i', [10,15,3,34])
    kTest2 = 17

    print("## TEST 2 ##")
    if checkmatch(numListTest2, kTest2):
        print ("There is a match\n")
    else:
        print ("There is no match\n")
     
    
    
import random




"""

name= input('Enter name: ')
age =int(input('Enter age: '))

#this is called a formated  string, it is much easier to write and read.
msg = f'your name is {name} and you're {age} years old.'

""" 

#----------------------------------------
#Weight converter

""" weight = int(input('weight:'))

type = input('L(bs) or K(g):')

if(type.upper() == 'L'):
   result = weight / 2.2
   print (f'your weight is {result} in Kilograms')

elif (type.upper() == 'K'):
   result = weight * 2.2
  print(f'your weight is {result} in pounds')  */  
"""
#------------------------------------------------
#Guessing game
"""
    
num = random.randint(0,10)


counter = 1

while (counter <= 3):
    guessed = int(input('Guess the number chosen from 0 till 10:'))
    
    if guessed != num:
         
         counter = counter + 1 
    else:
        print('you win!')
        break

if counter >= 3:
    print('you lose!')
    
    """
    
#------------------------------------------------
#Car game
""" 
print('Write "help" command if stuck.')
flag = False               
while True: 
    command = input(">")
    if command.lower() == "help":
        print(''' 
            Start --> Starts the car  
            Stop --> makes the car Stop
            End  --> exits the game
            ''')
     
       
    
    elif command.lower() == "start":
       if flag == False: 
        print("Engine is running...you can go now.")
        flag = True
       else:
           print("Car is already on.") 
        
    
    elif command.lower() == "stop":
        if flag == True:
            print("Engine is off.")
            flag = False
        else:
            print("car is already off.")    
       
    elif command.lower() == "end":
        break
    else:
        print(' I dont understand...')
"""


#-------------------------------------------------------
#F shape
"""
numbers = [5,2,5,2,2]

for number in numbers:
    print("x" * number)
"""


#----------------------------------------------------------
#Biggest number
"""
numbers = [1,2,3,4,5,6,7]
max = numbers[0]
for x in numbers:
    if x > max:
        max = x
print(max)        
"""


#------------------------------------------------------------
#Remove duplicates
"""

list = [3,3,6,5,6,8,1,2]
list2 = []
for i in list:
    if i not in list2:
        list2.append(i)
print(list2)            

"""


#------------------------------------------------------------
#Classes
"""
class Person:
    
    def __init__(self,name) :
        self.name = name
    
    
    def talk(self):   
        print(f"my name is {self.name}")

class employee(Person): #inheritance 
    pass #For empty classes

        
#person1 = Person('joe')
#person1.talk()
""" 




#------------------------------------------------------
#Rand & Classes

class Dice:
    
    def Roll(self):
        result = (random.randint(1,6),random.randint(1,6))
        return result


dice =Dice()
print(dice.Roll())    
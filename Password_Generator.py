import random
import string

def password_generator(min_length,numbers=True,special_character=True):
    letters = string.ascii_letters
    digits = string.digits
    specials = string.punctuation
    words = letters
    
    if numbers:
        words += digits
    if special_character:
        words += specials
        
    pwd = ''
    
    while  len(pwd) < min_length:
        new_pass = random.choice(words)
        pwd += new_pass
        
        if numbers:
            new_pass += digits
        elif special_character:
            new_pass += specials
        
    return pwd

min_length = int(input('What will be the length of your password? '))
numbers = input('Do you want numbers included? (Type yes/no) ').lower()
if numbers == "yes":
    numbers == True
else:
    numbers == False
special_character = input('Do you want special characters included? (Type yes/no) ').lower()
if special_character == "yes":
    special_character == True
final_password = password_generator(min_length,numbers,special_character)
print(final_password)

def store():
    stored_password = final_password
    password_string = str(stored_password)
    with open('stored password.txt', 'a') as sp:
        sp.write(password_string)
    print('Password stored! Kindly search for ', 'stored ','password.txt',' on your computer.')
    
def view_pass():
    stored_password = final_password
    password_string = str(stored_password)
    with open('storedpassword.txt', 'r') as sp:
        for line in sp.readlines():
           print("Your new password is ", password_string ) 

storage = input("Do you want to store your password? type(y if you want to store / n for no)").lower()
if storage == 'y':
    store()
else:
    print('You can try another password')
view_pswd = input("Would you like to view your stored password? (type y/n) ").lower()
if view_pswd == "y":
    view_pass()
else:
    quit()
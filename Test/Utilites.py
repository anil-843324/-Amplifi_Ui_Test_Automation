import random
import string
from datetime import date, timedelta

def generate_random_email(length=10):
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    domain = random.choice(['yopmail.com'])
    return random_part + '@' + domain

random_email = generate_random_email()


def generate_random_first_name(length):
    # Mr.
   letters = string.ascii_letters
   result = ''.join(random.choice(letters) for _ in range(length))
   return result
          
first_name = generate_random_first_name(5)

# Getting a random last name

def generate_random_last_name(length):
    # Mr.
   letters = string.ascii_letters
   result = ''.join(random.choice(letters) for _ in range(length))
   return result
    
       
last_name = generate_random_last_name(5)
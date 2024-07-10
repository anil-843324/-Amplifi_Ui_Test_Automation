import random
import string
from datetime import date, timedelta
from urllib.parse import urlparse

def generate_random_email(length=10):
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    domain = random.choice(['yopmail.com'])
    return random_part + '@' + domain

random_email = generate_random_email()


def generate_random_first_name(length=3):
    letters = string.ascii_lowercase  # Use lowercase letters only
    result = ''.join(random.choice(letters) for _ in range(length))
    return result

first_name = generate_random_first_name()


# Getting a random last name

def generate_random_last_name(length):
    # Mr.
   letters = string.ascii_letters
   result = ''.join(random.choice(letters) for _ in range(length))
   return result
    
       
last_name = generate_random_last_name(5)


def extract_path_segment(url_string):
    parsed_url = urlparse(url_string)
    path_segments = parsed_url.path.split('/')
    return path_segments[2] if len(path_segments) > 2 else ""



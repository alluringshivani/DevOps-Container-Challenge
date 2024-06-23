import requests

BASE_URL = "http://localhost:8000"

def test_hello():
    response = requests.get(f"{BASE_URL}/hello")
    print(response.text)

def test_add_user():
    payload = {
        "username": "example_user",
        "email": "user@example.com",
        "full_name": "Example User"
    }
    response = requests.post(f"{BASE_URL}/user/add", json=payload)
    print(response.text)

def test_retrieve_user():
    username = "example_user"
    response = requests.get(f"{BASE_URL}/user/retrieve/{username}")
    print(response.text)

if __name__ == "__main__":
    test_hello()
    test_add_user()
    test_retrieve_user()



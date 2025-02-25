# 0x16. API Advanced

## 📌 Project Overview
This project explores advanced API concepts using the **Reddit API**. It focuses on:
- Reading API documentation to find endpoints
- Making API requests and handling JSON responses
- Implementing pagination to retrieve multiple pages of data
- Using recursion for continuous data fetching
- Sorting API data by specific criteria
- Handling rate limits and API restrictions effectively

---

## 🚀 Learning Objectives
By the end of this project, you will be able to:
1. **Read API Documentation** – Identify correct endpoints, request methods, and response formats.
2. **Use an API with Pagination** – Retrieve multiple pages of data efficiently using the `after` parameter.
3. **Parse JSON Responses** – Extract, filter, and manipulate data from API responses.
4. **Make Recursive API Calls** – Automate data retrieval until all relevant data is fetched.
5. **Sort API Data** – Organize and analyze API responses based on specific values (e.g., upvotes, comments).
6. **Implement Rate Limiting Strategies** – Handle API request limits efficiently to avoid getting blocked.
7. **Use Authentication for APIs** – Access protected endpoints using API keys, OAuth, or other authentication methods.

---

## 🔧 Installation & Setup
### 1️⃣ Clone the repository
```sh
git clone https://github.com/yourusername/api-advanced.git
cd api-advanced
```

### 2️⃣ Create a virtual environment (optional but recommended)
```sh
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3️⃣ Install required dependencies
```sh
pip install requests
```

---

## 📜 Usage & Examples
### **1️⃣ Fetch Top Reddit Posts**
Retrieves the top 5 posts from a given subreddit:
```python
import requests

def get_reddit_posts(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/top.json?limit=5"
    headers = {"User-Agent": "my-app"}
    
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        posts = data["data"]["children"]
        for post in posts:
            print(f"🔥 {post['data']['title']} (Upvotes: {post['data']['score']})")
    else:
        print("❌ Failed to fetch data. Status Code:", response.status_code)

# Example usage
get_reddit_posts("python")
```

### **2️⃣ Implementing Pagination**
Fetching multiple pages using the `after` parameter:
```python
def get_paginated_posts(subreddit, after=None):
    url = f"https://www.reddit.com/r/{subreddit}/top.json"
    params = {"limit": 5, "after": after}
    headers = {"User-Agent": "my-app"}

    response = requests.get(url, params=params, headers=headers)
    if response.status_code == 200:
        data = response.json()
        for post in data["data"]["children"]:
            print(f"🔥 {post['data']['title']} (Upvotes: {post['data']['score']})")

        if data["data"].get("after"):
            get_paginated_posts(subreddit, data["data"]["after"])
    else:
        print("❌ Error fetching data. Status Code:", response.status_code)

# Example usage
get_paginated_posts("python")
```

### **3️⃣ Sorting API Data by Upvotes**
Sorting fetched posts by upvotes:
```python
posts = {
    "Python 3.12 Released!": 1200,
    "Flask vs Django?": 950,
    "Best Python Tricks": 1800
}

sorted_posts = sorted(posts.items(), key=lambda x: x[1], reverse=True)
for title, score in sorted_posts:
    print(f"🔥 {title} (Upvotes: {score})")
```

### **4️⃣ Handling Rate Limits**
Reddit imposes rate limits. Implementing a delay between requests prevents getting blocked:
```python
import time

def get_reddit_posts_with_delay(subreddit, delay=2):
    url = f"https://www.reddit.com/r/{subreddit}/top.json?limit=5"
    headers = {"User-Agent": "my-app"}
    
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        for post in data["data"]["children"]:
            print(f"🔥 {post['data']['title']} (Upvotes: {post['data']['score']})")
            time.sleep(delay)  # Wait to avoid rate limits
    else:
        print("❌ Failed to fetch data. Status Code:", response.status_code)

# Example usage
get_reddit_posts_with_delay("python")
```

### **5️⃣ Authentication for APIs**
Some APIs require authentication. Example of using an API key:
```python
API_KEY = "your_api_key_here"
def get_protected_data():
    url = "https://api.example.com/protected-endpoint"
    headers = {"Authorization": f"Bearer {API_KEY}", "User-Agent": "my-app"}
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        print(response.json())
    else:
        print("❌ Authentication failed. Check API key.")

# Example usage
get_protected_data()
```

---

## 📌 Key Features
✅ Fetch Reddit posts using **API requests**  
✅ Implement **pagination** to retrieve more results  
✅ Use **recursive calls** to automate data fetching  
✅ Parse **JSON responses** efficiently  
✅ Sort API results based on key **values** (upvotes, comments, etc.)  
✅ Handle **rate limits** to avoid API restrictions  
✅ Implement **authentication** for secure API access  

---

## 🤖 Next Steps
- Extend the project to fetch data from the **Twitter API**
- Analyze and **visualize** API data using Pandas & Matplotlib
- Implement **error handling & retries** for robust API calls
- Use **OAuth 2.0 authentication** for accessing restricted endpoints

---

## 📝 Author
- **Duncan Korir **
- GitHub: duncorir(https://github.com/duncorir)

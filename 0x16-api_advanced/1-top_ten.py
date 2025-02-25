#!/usr/bin/python3
"""
Module to query the Reddit API and print the titles
of the first 10 hot posts for a given subreddit.
"""

import requests


def top_ten(subreddit):
    """Prints the titles of the first 10 hot posts for a given subreddit.

    Args:
        subreddit (str): The name of the subreddit to query.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    # Custom User-Agent to prevent Too Many Requests error

    headers = {"User-Agent": "my-app"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        posts = response.json().get("data", {}).get("children", [])
        for post in posts:
            print(post["data"].get("title"))
    else:
        print("None")


if __name__ == "__main__":
    subreddit = "python"  # Change this to test with other subreddits
    top_ten(subreddit)

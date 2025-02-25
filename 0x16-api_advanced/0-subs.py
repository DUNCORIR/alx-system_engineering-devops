#!/usr/bin/python3
"""
Module to query the Reddit API and return the number
of subscribers for a given subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit.

    Args:
        subreddit (str): The name of the subreddit to query.

    Returns:
        int: The number of subscribers, or 0 if the subreddit is invalid.
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    # Custom User-Agent to prevent Too Many Requests error
    headers = {"User-Agent": "my-app"}

    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        return response.json().get("data", {}).get("subscribers", 0)
    return 0


if __name__ == "__main__":
    subreddit = "python"  # Change to test with other subreddits
    print(f"Subscribers in r/{subreddit}: {number_of_subscribers(subreddit)}")

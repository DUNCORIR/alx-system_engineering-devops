#!/usr/bin/python3
"""
Module to query the Reddit API recursively and
return a list of all hot article titles for a given subreddit.
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """Recursively fetches all hot article titles for a given subreddit.

    Args:
        subreddit (str): The name of the subreddit to query.
        hot_list (list): Accumulator for storing hot post titles.
        after (str): Pagination parameter for fetching the next set of results.

    Returns:
        list: A list containing the titles of all hot articles,
        or None if invalid subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    # Custom User-Agent to prevent Too Many Requests error
    headers = {"User-Agent": "my-app"}
    params = {"after": after, "limit": 100}

    response = requests.get(
        url, headers=headers, params=params, allow_redirects=False
    )
    if response.status_code == 200:
        data = response.json().get("data", {})
        posts = data.get("children", [])
        for post in posts:
            hot_list.append(post["data"].get("title"))

        # Recursive call if more pages exist
        after = data.get("after")
        if after:
            return recurse(subreddit, hot_list, after)
        return hot_list
    return None


if __name__ == "__main__":
    subreddit = "python"  # Change this to test with other subreddits
    titles = recurse(subreddit)
    if titles:
        print(f"Total {len(titles)} hot articles found.")
    else:
        print("None")

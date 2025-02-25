#!/usr/bin/python3
"""
Module to query the Reddit API recursively, fetch hot article titles,
and count occurrences of given keywords.
"""

import requests
import re
from collections import Counter


def count_words(subreddit, word_list, after=None, word_count={}):
    """Recursively fetches hot article titles and counts keyword occurrences.

    Args:
        subreddit (str): The name of the subreddit to query.
        word_list (list): List of keywords to count occurrences for.
        after (str): Pagination parameter for fetching the next set of results.
        word_count (dict): Accumulator for counting occurrences.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "my-app"}
    params = {"after": after, "limit": 100}

    response = requests.get(
        url, headers=headers, params=params, allow_redirects=False
    )
    if response.status_code != 200:
        return

    data = response.json().get("data", {})
    posts = data.get("children", [])

    # Normalize word list
    word_list = [word.lower() for word in word_list]

    for post in posts:
        title = post["data"].get("title", "").lower()
        # Extract words without punctuation
        words = re.findall(r"\b\w+\b", title)

        for word in words:
            if word in word_list:
                word_count[word] = word_count.get(word, 0) + 1

    # Recursive call if more pages exist
    after = data.get("after")
    if after:
        return count_words(subreddit, word_list, after, word_count)

    # Sort and print results
    sorted_counts = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))
    for word, count in sorted_counts:
        print(f"{word}: {count}")


if __name__ == "__main__":
    subreddit = "python"  # Change this to test with other subreddits
    keywords = ["python", "java", "javascript", "django", "flask"]
    count_words(subreddit, keywords)

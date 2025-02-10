#!/usr/bin/python3
"""
The script fetches TODO list progress for all employees from a REST API
and exports the data in JSON format.
"""
import json
import requests


def fetch_all_todos():
    """Fetch TODO list for all employees and save it as a JSON file."""
    base_url = "https://jsonplaceholder.typicode.com"

    # Fetch all users
    users_response = requests.get(f"{base_url}/users")
    if users_response.status_code != 200:
        print("Error: Unable to fetch users data.")
        return

    users = users_response.json()
    all_todos = {}

    # Fetch todos for each user
    for user in users:
        user_id = user.get("id")
        username = user.get("username")

        todos_response = requests.get(f"{base_url}/todos?userId={user_id}")
        if todos_response.status_code == 200:
            todos = todos_response.json()
        else:
            todos = []

        # To ensure all users exist in output, even with no tasks
        all_todos[user_id] = [
            {
                "username": username,
                "task": todo["title"],
                "completed": todo["completed"]
            }
            for todo in todos
        ] if todos else []  # Ensure empty list if no tasks

    # Save to JSON file
    with open("todo_all_employees.json", "w") as json_file:
        json.dump(all_todos, json_file, indent=4)

    print("Data successfully saved to todo_all_employees.json")


if __name__ == "__main__":
    fetch_all_todos()

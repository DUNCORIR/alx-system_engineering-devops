#!/usr/bin/python3
"""
The script fetches TODO list progress for a given employee ID
from a REST API and exports data to a JSON file.
"""
import json
import requests
import sys


def export_employee_todo_to_json(employee_id):
    """Fetch and export employee TODO list progress to a JSON file"""
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{base_url}/users/{employee_id}"
    todos_url = f"{base_url}/todos?userId={employee_id}"

    user_response = requests.get(user_url)
    todos_response = requests.get(todos_url)

    if user_response.status_code != 200 or todos_response.status_code != 200:
        print("Error: Unable to fetch data.")
        return

    user_data = user_response.json()
    todos_data = todos_response.json()

    username = user_data.get("username")

    tasks_list = [
        {
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": username
        }
        for task in todos_data
    ]

    json_data = {str(employee_id): tasks_list}

    file_name = f"{employee_id}.json"
    with open(file_name, "w", encoding="utf-8") as json_file:
        json.dump(json_data, json_file, indent=4)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./export_to_json.py <employee_id>")
        sys.exit(1)

    try:
        employee_id = int(sys.argv[1])
        export_employee_todo_to_json(employee_id)
    except ValueError:
        print("Error: Employee ID must be an integer.")
        sys.exit(1)

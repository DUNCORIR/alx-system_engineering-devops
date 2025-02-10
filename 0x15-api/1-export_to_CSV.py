#!/usr/bin/python3
"""
Fetches an employee's TODO list from a REST API and exports it in CSV format.
"""
import csv
import requests
import sys


def export_to_csv(employee_id):
    """Fetch and export employee TODO list to CSV"""
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

    user_id = user_data.get("id")
    username = user_data.get("username")
    filename = f"{user_id}.csv"

    # Write data to CSV file
    with open(filename, mode="w", newline="") as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for task in todos_data:
            writer.writerow([user_id, username,
                             task.get("completed"), task.get("title")])

    print(f"Data exported to {filename} successfully.")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./1-export_to_CSV.py <employee_id>")
        sys.exit(1)

    try:
        employee_id = int(sys.argv[1])
        export_to_csv(employee_id)
    except ValueError:
        print("Error: Employee ID must be an integer.")
        sys.exit(1)

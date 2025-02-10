# 0x15. API

## Description
This project focuses on understanding and implementing APIs using Python. We will explore RESTful APIs, handling JSON and CSV data, and writing Pythonic code following PEP8 guidelines. The goal is to develop a solid foundation in working with APIs, microservices, and best practices in back-end development.

## Learning Objectives
At the end of this project, you will be able to:
- Explain why Bash scripting is not ideal for API handling.
- Define what an API is and how it works.
- Understand the principles of REST APIs.
- Describe microservices and their benefits.
- Work with CSV and JSON data formats.
- Follow Pythonic naming conventions (packages, modules, classes, variables, functions, constants).
- Apply CapWords (CamelCase) and other PEP8 best practices in Python.

## Requirements
- Allowed editors: `vi`, `vim`, `emacs`
- All Python files should be interpreted/compiled on **Ubuntu 20.04 LTS** using `python3 (version 3.8.5)`.
- All files should end with a new line.
- The first line of all scripts should be exactly `#!/usr/bin/python3`.
- Imported libraries must be organized in alphabetical order.
- A `README.md` file at the root of the project directory is mandatory.
- Code should follow `pycodestyle (version 2.8.*)`.
- All scripts must be executable.
- The length of files will be tested using `wc`.
- All modules should include documentation (`python3 -c 'print(__import__("my_module").__doc__)'`).
- Dictionary values should be accessed using `get()` to avoid exceptions.
- Scripts should include `if __name__ == "__main__":` to prevent execution when imported.

## Resources
- [Friends don’t let friends program in shell script](https://example.com)
- [What is an API?](https://example.com)
- [What is a REST API?](https://example.com)
- [What are microservices?](https://example.com)
- [PEP8 Python style guide](https://example.com)

## Tasks Overview
1. **Fetching API Data** - Use `requests` to retrieve JSON data from an API.
2. **Processing API Responses** - Extract useful information and handle errors.
3. **Storing Data** - Save API responses in CSV or JSON format.
4. **Building a REST API** - Use Flask to create a simple RESTful API.
5. **Advanced API Handling** - Authentication, pagination, and error handling.

## Installation
To run the scripts, ensure you have Python 3 installed and install required libraries:
```sh
sudo apt update && sudo apt install python3
pip install requests
```

## Usage
Execute scripts using:
```sh
./script_name.py
```
Ensure the scripts have executable permissions:
```sh
chmod +x script_name.py
```

## Author
Duncan Korir
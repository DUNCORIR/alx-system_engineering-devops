Web Stack Debugging - Task 0
This project is part of the ALX System Engineering and DevOps curriculum. The goal of this task is to get Apache to run on a Docker container and to return a page with the message "Hello ALX" when querying the root of it.

Task Description
The task requires you to:

Launch a Docker container.
Get Apache to serve a page that contains the message "Hello ALX" when accessing port 8080 of the container.
Ensure that the server is responsive and does not return errors such as "400 Bad Request" or "Empty reply from server".
Requirements
Docker installed on your machine.
Basic knowledge of Docker commands and working with containers.
Understanding of Apache configuration and troubleshooting.
Steps to Complete the Task
Build the Docker image: First, build the Docker image using the Dockerfile provided in the project directory:

bash
Copy
Edit
docker build -t alx/265-0 .
Run the Docker container: After building the Docker image, run the container with port mapping:

bash
Copy
Edit
docker run -p 8080:80 -d alx/265-0
Access the container: Connect to the container to make necessary changes:

bash
Copy
Edit
docker exec -it <container_name> /bin/bash
Create the index.html page: Once inside the container, create or modify the index.html file to display the "Hello ALX" message:

bash
Copy
Edit
echo "Hello ALX" > /var/www/html/index.html
Restart Apache: Restart Apache to ensure the changes are applied:

bash
Copy
Edit
apachectl restart
Verify the changes: Finally, use curl to check if the server is returning the "Hello ALX" page:

bash
Copy
Edit
curl http://0:8080
The output should be:

text
Copy
Edit
Hello ALX
Expected Output
Once the issue is resolved, accessing the container through port 8080 will return the following content:

html
Copy
Edit
Hello ALX
Additional Notes
The container should be running and listening on port 8080.
If you encounter issues with Apache not starting or binding to port 80, ensure that you have the necessary permissions or that no other process is using port 80.
Troubleshooting
If you encounter a "400 Bad Request" or "Empty reply from server" error, check the following:
Make sure the index.html file is correctly created in the /var/www/html/ directory.
Ensure Apache is running properly by restarting it using apachectl restart.
Confirm that Apache is listening on port 80 by checking the Docker container's port mapping with docker ps.
Conclusion
By following these steps, you should have a functional Apache server inside the Docker container, serving the message "Hello ALX" when accessed on port 8080.
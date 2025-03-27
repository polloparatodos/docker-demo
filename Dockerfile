# Adding python base image more images can be found at https://hub.docker.com/ for
# many different languages and frameworks
FROM python:3.12-slim-bookworm

# Directory which the application will run from (This should be the root of your project directory)
WORKDIR .

# Copying requirements file into the container dot (.) indicates all
# requirements listed within the file
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Adding all project files to container
COPY . .

# ---- COPY SPECIFY FILES ---

# When using copies we are not bound to add all files to the image at once
# Files which we may want to use can be explicitly stated as follows:

# COPY app.py requirements.txt config.ini /app/ <-- (EXAMPLE SHOWN HERE!)

# The COPY statement in the line above copies to the container the files app.py,
# requirements.txt, config.ini, and a specific container directory /app/

# --- COPY WILDCARDS ---

# The asterisk (*) can be used similar to that of a regular expression it will include
# any file which matches what comes either before or after the asterisk

# COPY *.py <-- (EXAMPLE SHOWN HERE)

# --- USING .dockerignore ---

# Utilizing this method allows for us to exclude certain files or directory from being a part of our image
# which otherwise exist within the project directory

# An example .dockerignore file can be written as follows:

    #__pycache__/
    #*.log
    #.git/
    #venv/
    #*.env
    #temp/

# Expose the application to the point which it will run on (MUST BE A VALID PORT)
EXPOSE 8080

# Define which applications to run project on
CMD ["python","src/cli_calculator.py"]

# --- RUNNING MULTIPLE FILES ---

# It is possible to run more than one Dockfile in an image at the same time
# To do this we must create a run.sh file and make this file an executable:

    # (run.sh FILE EXAMPLE)
    # 1.    #!/bin/bash
            #python script1.py &
            #python script2.py &
            #wait <-- Makes threads/processes running files in the application wait for all others to be completed


    # 2. chmod +x run.sh <-- (CREATES THE EXECUTABLE)

    # 3. The updated Dockerfile should be as follows:
        # FROM python:3.9-slim-buster
        # WORKDIR /app
        # COPY . .
        # CMD ["./run.sh"]

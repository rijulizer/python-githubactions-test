# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim-buster

# Copy the source files into the container
WORKDIR /docker_workdir
COPY . /docker_workdir

# Install pip requirements
RUN pip3 install virtualenv
RUN python3 -m venv web-app 
RUN . web-app/bin/activate
RUN python3 -m pip install -r requirements.txt

EXPOSE 5000
ENV PORT 5000

# Define the command to be run when the container is started
CMD exec gunicorn --bind :$PORT src.app:app --workers 1 --threads 1 --timeout 0

#the django app is written in python and needs the interpreter to run
FROM python:3.13.13-alpine@sha256:420cd0bf0f3998275875e02ecd5808168cf0843cbb4d3c536432f729247b2acc
#https://docs.docker.com/reference/dockerfile#cmd

#here i am specifying that the default folder in the container should be /app
WORKDIR /app

#this tells docker to copy the requirements.txt into the container's /app folder
COPY requirements.txt .

#run during the build process, this runs the command pip install in the docker container and installs all the packages in requirements.txt
RUN pip install -r requirements.txt

#this tells docker to copy the app files into the container
COPY . .

#this opens port 8000
EXPOSE 8000

#when the built container gets run, this is the first command that executes, it starts the django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

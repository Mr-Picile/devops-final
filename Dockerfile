
#dockerfile
FROM python:3.13.13-alpine@sha256:420cd0bf0f3998275875e02ecd5808168cf0843cbb4d3c536432f729247b2acc
#https://docs.docker.com/reference/dockerfile#cmd

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000



CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

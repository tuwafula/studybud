#!/bin/bash

pip install --upgrade pip

pip install -r requirements.txt

python manage.py makemigrations

python manage.py migrate

# create user groups


python manage.py shell <<EOF
from django.contrib.auth.models import User

# Check if the superuser already exists
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'wafulaat@gmail.com', 'admin1234')
EOF
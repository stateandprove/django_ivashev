#!/bin/bash
python manage.py migrate --no-input
python manage.py collectstatic --no-input
gunicorn djangotutorial.wsgi:application -b 0.0.0.0:8000 --workers 2 --threads 3 --reload

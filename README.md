# Учебное приложение для создания опросов

Это учебное приложение, позволяющее создавать простые опросы. Включает в себя:

* Модели
* REST API
* Роли и права доступа
* Swagger

# Деплой

## 1. Задайте переменные окружения
В корне проекта создайте файл .env со следующим содержимым:

```bash
  DJANGO_SECRET_KEY=your_secret_key
  DEBUG=True
  ALLOWED_HOSTS=127.0.0.1
  DB_PASS=my_db_password
  DB_NAME=djangoproj_db
  DB_USER=postgres
  DB_HOST=postgres
  DB_PORT=5432
```

## 2. Запуск приложения

Запуск приложения производится с помощью команды

```bash
    docker compose up --build
```

При первом запуске необходимо создать суперпользователя:


```bash
    docker compose exec web python manage.py createsuperuser --username admin
```

# Загружаем официальный образ Python версии 3.13, собранный на базе Alpine Linux
FROM python:3.13

# Запретит создавать .pyc файлы
ENV PYTHONDONTWRITEBYTECODE=1
# Запретит кешировать вывод
ENV PYTHONUNBUFFERED=1

# Задаем пользователя, группу и рабочую директорию
ENV USER=django_web
ENV GROUP=maintenance
ENV WORK_DIR="/usr/src/app"

# Создаем рабочую директорию
RUN mkdir -p ${WORK_DIR}
WORKDIR ${WORK_DIR}

# Создаем группу, юзера, добавляем юзера в группу и даем ему права доступа
RUN addgroup --system ${GROUP} && \
    adduser --system --ingroup ${GROUP} ${USER} --shell /bin/bash && \
    chown -R ${USER}:${GROUP} ${WORK_DIR}

# Прокидываем список зависимостей
COPY ./requirements.txt .

# Обновляем pip и устанавилваем зависимости
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Прокидываем файлы проекта
COPY . ${WORK_DIR}

# Даем доступ к папке со статикой
RUN chmod -R og+w ${WORK_DIR}/static/

# Переключаемся на созданного юзера
USER ${USER}

ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh"]
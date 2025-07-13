# Dockerfile
FROM python:3.10-slim

# Создаём рабочую директорию
WORKDIR /app

# Копируем зависимости отдельно для кеширования
COPY requirements.txt .

# Установка зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Копируем всё приложение
COPY . .

# Открываем порт (если нужно)
EXPOSE 8080

# Запуск приложения через uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

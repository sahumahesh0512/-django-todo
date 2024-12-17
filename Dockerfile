FROM python:3

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Apply database migrations first
RUN python manage.py migrate

# Start Django development server (bind it to 0.0.0.0 to allow external connections)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

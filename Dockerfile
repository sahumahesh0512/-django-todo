# Start with the official Python image
FROM python:3

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Upgrade pip to the latest version
RUN python -m pip install --upgrade pip

# Install dependencies
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

# Apply database migrations first
RUN python manage.py migrate

# Start Django development server (bind to 0.0.0.0)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

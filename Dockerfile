# Start from a computer that already has Python installed
FROM python:3.11-slim

# Create /app folder and work inside it
WORKDIR /app

# Copy the dependency list first, then install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project
COPY . .

# Label: the app serves on port 5000
EXPOSE 5000

# Start the web app on port 5000 when the container boots
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
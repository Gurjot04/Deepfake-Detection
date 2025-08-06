FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies (optional, based on what you use)
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose Streamlit default port
EXPOSE 8501

# Run your app (adjust as needed)
CMD ["streamlit", "run", "Deepfake_detector_UI.py"]

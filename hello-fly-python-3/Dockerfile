# Stage 1: Build the Application
FROM python:3.9 AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Define the application entrypoint file (change this if your main file is different)
ENV APP_FILE="server.py"

# Copy requirements file first (if it exists)
COPY requirements.tx[t] ./requirements.txt

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies if requirements.txt exists
RUN pip install --upgrade pip && \
    if [ -f requirements.txt ]; then \
        pip install -r requirements.txt; \
    fi

# Copy the rest of the application source code
COPY . .

# Now that the code is in the image, verify that the app file exists
RUN set -e; \
    echo "Checking for file: $APP_FILE"; \
    if [ ! -f "$APP_FILE" ]; then \
        echo "ERROR: $APP_FILE is required but was not found"; \
        echo "Current directory listing:"; \
        ls -la; \
        exit 1; \
    fi; \
    echo "$APP_FILE found, continuing build..."

# Stage 2: Final Runtime Image
FROM python:3.9

# Set the working directory
WORKDIR /usr/src/app

# Copy the virtual environment and app code from the build stage
COPY --from=build /opt/venv /opt/venv
COPY --from=build /usr/src/app .

# Use the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# APP_FILE is also needed at runtime
ENV APP_FILE="server.py"

# Create a non-root user to run the application
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /usr/src/app
USER appuser

# Expose the port your app listens on
ENV PORT=8080
EXPOSE 8080

# Start the application
CMD python "$APP_FILE"

# Use Python 3.11 as the base image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app

# Copy all necessary files
COPY distance_classification.ipynb .
COPY requirements.txt .

# Install dependencies (ensure jupyter is installed)
RUN pip install -r requirements.txt || true
RUN pip install jupyter

# Expose Jupyter Notebook port
EXPOSE 8888

# Set the command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]


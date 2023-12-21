#!/bin/bash

# Define the directory for the virtual environment
VENV_DIR="my_venv"

# Define your requirements in a requirements.txt file
# or list them directly as PIP_PACKAGES variable
# Example: PIP_PACKAGES="sqlalchemy psycopg2 pymysql"
REQUIREMENTS_FILE="requirements.txt"

# Create a requirements.txt file with the needed packages
cat > ${REQUIREMENTS_FILE} << EOF
sqlalchemy
psycopg2-binary
pymysql
EOF

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it before running this script."
    exit 1
fi

# Create the virtual environment if it doesn't exist
if [ ! -d "${VENV_DIR}" ]; then
    python3 -m venv ${VENV_DIR}
    echo "Virtual environment created at ${VENV_DIR}/"
else
    echo "Virtual environment already exists at ${VENV_DIR}/"
fi

# Activate the virtual environment
source ${VENV_DIR}/bin/activate
echo "Activated the virtual environment."

# Update pip to the latest version
pip install --upgrade pip

# Install the required pip packages
if [ -f "${REQUIREMENTS_FILE}" ]; then
    pip install -r ${REQUIREMENTS_FILE}
    echo "Installed pip packages from ${REQUIREMENTS_FILE}."
else
    echo "Requirements file not found. Cannot install pip packages."
    deactivate
    exit 1
fi

# Deactivate the virtual environment
deactivate
echo "Virtual environment setup complete. To activate, run: source ${VENV_DIR}/bin/activate"

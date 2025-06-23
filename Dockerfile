FROM python:3.11-slim

WORKDIR /app

# 🔧 Instala librerías necesarias para mysqlclient
RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    apt-get clean

# 📦 Instala dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 📂 Copia el resto del proyecto
COPY . .

# 🚀 Arranca el backend
CMD ["python", "run.py"]

# Use uma imagem oficial do Python como imagem base
FROM python:3.10-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o resto do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para o mundo exterior
EXPOSE 8000


CMD uvicorn app:app --host 0.0.0.0 --port $PORT

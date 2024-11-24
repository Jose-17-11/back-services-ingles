# Usa una imagen base de Node.js
FROM node:20.17.0

# Establece el directorio de trabajo
WORKDIR /backend-ingles

# Copia el archivo de dependencias y el código
COPY package*.json ./
RUN npm install

COPY . .

# Expone el puerto de la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "run", "dev"]
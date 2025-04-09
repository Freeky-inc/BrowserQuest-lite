# Dockerfile

FROM node:18

# Dossier de travail dans le container
WORKDIR /app

# Copier uniquement le dossier server
COPY server ./server

# Aller dans le dossier server
WORKDIR /app/server

# Exposer le port utilisé par le serveur
EXPOSE 8000

# Lancer le serveur
CMD ["node", "server/js/main.js"]


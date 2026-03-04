# Utiliser une image Node.js
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier package.json et package-lock.json AVANT pour optimiser le cache
COPY package*.json ./

# Installer uniquement les dépendances de production (plus léger et sécurisé)
RUN npm install --omit=dev

# Copier TOUT le code APRÈS l'installation
COPY . .

# Exposer le port de l'application (doit correspondre au port dans ton code Node.js)
EXPOSE 3000

# Commande de démarrage standard pour la production
# (Remplace "index.js" par le nom de ton fichier principal, ex: "server.js", "app.js")
CMD ["node", "index.js"]
# Utilisez une image de base Python
FROM python:3.8-alpine3.18

# Mise à jour de python et utilisez la version et package récente

#RUN apt-get update \
#&& apt-get upgrade -y

# Copiez le fichier requirements.txt dans le conteneur
COPY ./requirements.txt /app/requirements.txt

# Travaillez dans ce répertoire
WORKDIR /app

# intallation des bibliothèques du fichier requirements.txt (les exigences) dans le conteneur
# NB : RUN ici va pointer dans le repertoire app, ce qui explique
# qu'on ait copié d'abord le fichier requirements.txt dans app
RUN pip install -r requirements.txt

# copy all content to work directory /app
# all content into our source repository (ExoOrchesPyApiDb:
# repository in which Dockerfile is)
COPY . /app

# Ports d'entrée
EXPOSE 5000

# Lancer l'application main.py via l'interpréteur python
CMD ["python", "/app/main.py"]
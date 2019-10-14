NGNode
======

/!\ Très important /!\ Il est de la responsabilité de la procédure de login postgres de répondre
un cookie `accesstoken` contenant le `Bearer sdlfksoj3092ujsdf.fd0isdfkj` dont Postgrest a besoin.

Image docker utilisée pour les projets alliant nodejs avec un nginx pour servir les fichiers statiques.

Il faut monter l'application node dans `/app` et les fichiers statiques dans `/static` (qui seront alors servis depuis / par nginx)

La stratégie de nginx est pour une URL donnée de

1. Regarder dans `/static` pour voir si un fichier correspond
2. Si il n'y en avait pas, refiler l'URL au serveur NodeJS pour voir s'il s'en dépatouillerait pas (et il la file tel quel)

Dans `/app`, l'application est toujours lancée avec un `npm start`


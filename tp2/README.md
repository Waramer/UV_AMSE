# AMSE - TP2 : "Jeu de Tacquin"

Cette application Flutter reprends différentes étapes vers la création d'un jeu de tacquin, que l'on peut examiner via la liste de la page d'acceuil. Pour jouer au jeu de tacquin final, il suffit de cliquer sur l'activité '7 Tacquin'.

## Le jeu de Tacquin

### Principe de base
Dans le jeu de Tacquin, une image choisie ou non va être découpée en tuiles. Une tuile sera sélectionnée au hasard. Par une seccesion d'échanges aléatoires, entre la tuile active et une de ces tuiles voisines, l'ensemble des tuiles sera mélangé. Le but est de reformer l'image initiale. La tuile à bouger est encadrée en blanc, et chacune de ses tuiles voisines sont encadrées en rouge. Seules les tuiles voisines sont échangeables et cela se fait en tapant sur la tuile voisine à échanger. Il est aussi possible d'annuler le dernier coup effectuer via le bouton "annuler" se trouvant n haut de l'écran à côté du compteur de coups. Il n'y a pas de limite de coups.

### Réglages
Afin de régler le nombre de colonnes (i.e. lignes) pour le jeu, il suffit de modifier le nombre apparaissant en dessous du texte "Divisions" via les boutons cheveron haut ou bas qui l'encadrent.
Afin de régler le mélange aléatoire des tuiles, il suffit de modifier le nombre apparaissant en dessous du texte "Mélange" via les boutons cheveron haut ou bas qui l'encadrent.

### Images
Les images peuvent être choisies dans la base de donnée du jeu via le bouton "Image", ou alors choisi aléatoirement sur Internet via le bouton "Aléatoire en ligne".
Attention : dans la version actuelle, l'image provenant d'internet ne se recharge pas tout le temps
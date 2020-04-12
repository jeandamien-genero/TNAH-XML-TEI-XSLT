# Devoir d'XML-TEI et XSLT

## Édition à visée paléographique : Récits hagiographiques du manuscrit 411 de la Bibliothèque nationale de France.

École nationale des chartes, M2 TNAH, cours de [@ArianePinche](https://github.com/ArianePinche), 2020.

Texte choisi : [Suite de la Vie de saint Brice, fol.169d-fol170b : « Enfes je te conjur de part nostre seignor »](https://gallica.bnf.fr/ark:/12148/btv1b107209247/f175.item.zoom).

---

### Consignes générales

* Structurer le texte en ```XML-TEI``` en vue d’une édition et en respectant le genre littéraire auquel il appartient ;
* Compléter de la manière la plus précise possible le teiHeader de l'édition, en fonction des éléments nécessaires à son établissement et à la compréhension du texte ;
* Écrire un schéma ```ODD``` adapté à l'encodage et documenté.
  - Générer une ```ODD``` à partir de oddbyexample et associer le schéma rng correspondant au fichier ```XML```.
	- À partir de l'```ODD```, générer la documentation ```HTML``` du projet.
		- Présenter en introduction le projet et ses exploitations possibles ;
		- Documenter le fonctionnement de l'encodage et le choix des balises.
* Créer une feuille de transformation simple ;
* Maîtriser ```XPath```et ses fonctions de base ;

---

### Consignes de l'édition paléographique (```XML-TEI```, ```XML-ODD```)

* Transcrire le texte à partir de la numérisation du manuscrit sur Gallica.
* Structurer le texte fourni en divisions de type section en fonction des initiales ornées, et en paragraphes si des subdivisions semblent nécessaires pour le sens ;
* Renseigner le teiHeader, et plus précisément le msDesc à l’aide de la notice Gallica du manuscrit 411 et de la [notice Jonas](http://jonas.irht.cnrs.fr/consulter/manuscrit/detail_manuscrit.php?projet=71287#Association) ;
* Encoder les abréviations et les normalisations graphiques de manière à conserver la graphie originale et à proposer une graphie régularisée (penser à utiliser une fonte adaptée, ainsi qu’à proposer des entités décimales pour les caractères spéciaux);
* Faire un index des noms de personnages et de lieux ;
* Écrire l’ODD la plus restrictive possible en fonction de l'encodage ;
* Ajouter dans l'ODD la documentation sur le projet d’encodage, les éléments encodés : pourquoi et comment.
* Présenter comment cet encodage pourrait être exploité.

---

### Consignes de la transformation ```XSLT```

* Mettre en place une structure d'accueil en ```HTML``` ;
* Rédiger des règles simples avec un ```XPath``` valide pour insérer des informations du document source dans le document de sortie ;
* Créer une ou des règles avec des conditions ;
* Utiliser une ou des règles avec ```<xsl:for-each>``` *(uniquement si cela est nécessaire)*
* Proposer un code facile à lire et commenté ;
* Simplifier le plus possible ses règles ```XSL```.

---

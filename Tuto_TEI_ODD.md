# Tutoriel pour créer une ODD et l'associer à un document XML-TEI

---

# Étape 1. Généer l'ODD
*pré-requis : avoir installer le scénario oddbyexample*

1. Je dois m'assuer que mon XML-TEI est dans un dossier tout seul.
2. Je suis sur mon fichier XML-TEI.
3. Je vais sur la "clef à molette" rouge : un menu s'affiche.
3. Je choisis le scénario "oddbyexample" (partie "Globales").
4. En bas, dans les sous-menus, je clique sur "éditer" : un nouveau menu s'affiche.
5. Je vais dans l'onglet "sortie". Sur la ligne "enregistrer sous", j'enlève le chemin absolu qui est mis d'office et je le remplace par le nom du fichier que je veux obtenir (ODD_NOM_MON_FICHIER.xml).
5. Je clique sur ok : le sous-menu "éditer" se ferme.
6. Je clique sur "appliquer le scénario" : le menu se ferme.
7. Le fichier ODD_NOM_MON_FICHIER.xml est créé dans le même dossier que mon fichier XML-TEI de départ.

---

# Association de l'ODD et du fichier XML-TEI via un fichier RELAX NG
*Nota : Je ne peux pas associer un fichier .xml directement à mon fichier XML-TEI. Un fichier TEI n'accepte que trois formes de schéma : DTD, du RELAX NG ou du XML schéma. Donc il faut que mon ODD (.xml) soit transformée grâce à une WSL en schéma RELAX NG.*

## Transformation de l'ODD en RELAX NG
1. Je suis dans mon fichier ODD (.xml).
2. J'applique une feuille de transofmration : menu document > transformation > configurer un scénario (raccourci : "clef à molette" rouge).
3. Je sélectionne le scénario "TEI ODD to RELAX NG XML" (pour le faire apparaitre, utiliser le filtre "ODD").
4. J'applique mon scénario à mon ODD : un fichier RELAX NG est créé. 

## Association du schéma RELAX NG au fichier XML-TEI
1. Je suis sur mon fichier XML-TEI.
2. Je vais dans document > schéma > associer un schéma (ou la punaise rouge).
3. Paramètre : je ne conserve pas les anciens liens avec les schémas TEI ; le type de schéma est "Syntaxe XML RELAX NG".
4. Je clique sur OK : c'est bon !
5. Après une modification de mon odd, je ne suis pas obligé de faire à nouveau l'association de l'ODD avec le RELAX NG. Je peux simplement appuyer sur le grand "play" rouge depuis mon fichier ODD.

---
punaise rouge = associer
fléche rouge play = transformer
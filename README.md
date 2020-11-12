# consmaster_patch

## PATH

- ce script bash est a placer à la racine de consmaster (dans le même dossier que le fichier install_dependances_ubuntu.sh)

## que fait-il ?

il permet de lancer consmaster avec Python3 et PySide2 (Qt)

- il édite juste les lignes import sans faire de détail (from lib import *), idéalement on importerait que le nécessaire (le programme originel ne le fait pas non plus)
- un fix dans le fichier cm_lisp_obj.py aux lignes 60 et 115 pour retirer un argument de trop

## testé avec

- Python 3.8.6 avec PySide2 5.15-1 et ply 3.11

## avertissement

- il faudra installer les dépendances : PySide2 et ply

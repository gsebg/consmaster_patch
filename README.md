# consmaster_patch

## PATH

Ce script bash est à placer à la racine de consmaster (dans le même dossier que le fichier install_dependances_ubuntu.sh) puis à exécuter : `./patch.sh` .

## que fait-il ?

Il permet d'utiliser PySid2 à la place de PySide qui n'est pas disponible avec les versions récentes de Python.
Il édite les fichiers de consmaster et uniquement ceux-là (le relancer n'aura aucun effet) :
- édition des lignes import sans faire de détails (from lib import *)
- un fix dans le fichier cm_lisp_obj.py aux lignes 60 et 115 pour retirer un argument de trop

## testé avec

Python 3.8.6, PySide2 5.15-1 et ply 3.11

## avertissement

Dépendances lib Python : PySide2 et ply

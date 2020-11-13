#!/usr/bin/env bash

PYSIDES=(./src/cm_update.py ./src/cm_main_menu.py ./src/cm_lisp_scene.py ./src/cm_add_user.py \
    ./src/cm_lisp_graphic.py ./src/cons_drawing.py ./src/cm_config.py ./src/cm_exercice_list.py \
    ./src/cm_stats.py ./src/consmaster.py ./src/cm_terminal.py ./src/cm_controller.py \
    ./src/cm_workspace.py ./src/cm_lisp_obj.py)

function pasici {
    printf "\nce script bash est a placer à la racine de consmaster (dans le même dossier que le fichier install_dependances_ubuntu.sh)\n\n"
    exit 1
}

for PYSIDE in ${PYSIDES[*]}
do
    if [ -w ${PYSIDE} ]
    then
        echo "${PYSIDE} : update PySide -> PySide2"
        sed -i '/PySide.QtCore/i\    from PySide2.QtWidgets import *' ${PYSIDE}
        sed -i 's/PySide.QtCore/PySide2.QtCore/' ${PYSIDE}
        sed -i 's/PySide.QtGui/PySide2.QtGui/' ${PYSIDE}
        sed -i 's/PySide\smodule/PySide2 module/' ${PYSIDE}
    else
        pasici
    fi
done

PATCHTHIS=./src/cm_lisp_obj.py
if [ -w ${PATCHTHIS} ]
then
    echo "${PATCHTHIS} : fix"
    sed -i '60s/parent, scene/parent/' ${PATCHTHIS}
    sed -i '115s/parent, scene/parent/' ${PATCHTHIS}
else
    pasici
fi

chmod u+x ./src/cons_drawing.py

printf "
- merci de lire le 'readme.txt' originel avant tout
- les dépendances pour Python sont : PySide2 et ply (pas besoin de sqlalchemy)
- lancez le programme avec ./src/cons_drawing.py uniquement
- testé avec Python 3.8.6 avec PySide2 5.15-1 et ply 3.11 en virtualenv\n\n"

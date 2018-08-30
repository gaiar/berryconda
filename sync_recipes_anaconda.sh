#!/bin/bash


CF_ROOT="../anaconda-recipes"
RECIPE_DIR="$(pwd)/anaconda_recipes"
#GIT_ARGS="-q"


sync_recipe() {

    recipe=$1

	mkdir -p ${CF_ROOT}
	pushd ${CF_ROOT} >/dev/null 2>&1

	feedstock_dir=${recipe}-feedstock

    #TODO: Add check if folder exists 
    #svn list https://github.com/AnacondaRecipes/aggregate/trunk/ -R | egrep "/$"

	if [ ! -d ${feedstock_dir} ]; then
        feedstock=https://github.com/AnacondaRecipes/aggregate/trunk/${feedstock_dir}
        svn checkout $feedstock
	fi

	cd ${feedstock_dir}

	if [ ! -d ${RECIPE_DIR}/${recipe}/ ]; then
		echo "[INFO] Directory for recipe ${recipe} doesn't exist. Creating. "
		mkdir -p ${RECIPE_DIR}/${recipe}/
	fi

	echo "[INFO] Copying recipe to ${RECIPE_DIR}/${recipe}/"
	cp -r recipe/* ${RECIPE_DIR}/${recipe}/
	popd >/dev/null 2>&1

}

usage() {
	echo
	echo "Usage: $0 package1 [package2 package3 ...]"
	echo "Sync recipe(s) with a AnacondaRecipes feedstock"
	echo "'$0 all' will sync all recipes"
    echo 
    echo "Requires Subversion to be installed."
}

if [[ $# -lt 1 ]]; then
	usage
	exit 1
fi

if [[ $1 == "all" ]]; then
	for recipe_dir in $(ls -d ${RECIPE_DIR}/*/); do
		recipe=$(basename $recipe_dir)
		echo "[INFO] Syncing $recipe recipe with AnacondaRecipes"
		sync_recipe $recipe
	done

else
	for recipe in "$@"; do
		echo "[INFO] Syncing $recipe recipe with AnacondaRecipes"
		sync_recipe $recipe
	done
fi
#!/bin/bash

# Dit script doet een workflow na.
# aanroepen vanuit de root van je project. Dus:
# ./scripts/test.sh
branch="main"
repository="xiffy/jenv-tax"
repo_name=`basename ${repository}`
taxonomy_name="jenv_taxonomy_2024"
# probably add
domain="jenv"

mkdir -p public/taxonomies/${branch} # just to be sure
git pull # the server creates packages as well
# remove package which we will rebuild
rm public/taxonomies/${branch}/${taxonomy_name}.zip 2>/dev/null

# create a new taxonomy package for given taxonomy
mkdir -p tmp
cd tmp
git clone git@github.com:$repository
cd ${repo_name}
echo ../../public/taxonomies/${branch}/${taxonomy_name} ${taxonomy_name}
zip -q -r ../../public/taxonomies/${branch}/${taxonomy_name} ${taxonomy_name}

cd ../..

ep=`python ./scripts/find_entrypoints.py tmp/${repo_name}/${taxonomy_name}`
packages=`python ./scripts/find_packages.py public/taxonomies/${branch}`

# clean up the mess
rm -rf tmp

echo Testing entrypoint: ${ep}
echo With packages: ${packages}

arelleCmdLine --packages "${packages}"  --validate --file "${ep}"

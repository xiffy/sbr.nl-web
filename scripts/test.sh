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

mkdir -p local-test/taxonomies/${branch} # just to be sure
# remove package which we will rebuild
cp -rup public/taxonomies/${branch} local-test/taxonomies/
rm local-test/taxonomies/${branch}/${taxonomy_name}.zip 2>/dev/null

# create a new taxonomy package for given taxonomy
mkdir -p tmp
cd tmp
git clone git@github.com:$repository
cd ${repo_name}
zip -q -r ../../local-test/taxonomies/${branch}/${taxonomy_name} ${taxonomy_name}

cd ../..  # get back to where you once belonged

ep=`python ./scripts/find_entrypoints.py tmp/${repo_name}/${taxonomy_name}`
packages=`python ./scripts/find_packages.py local-test/taxonomies/${branch}`

# clean up the mess
rm -rf tmp
# rm -rf local-test

echo Testing entrypoint: ${ep}
echo With packages: ${packages}

arelleCmdLine --packages "${packages}"  --validate --file "${ep}"


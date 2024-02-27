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

# remove obsolete package
mkdir -p public/taxonomies/${branch}
rm public/taxonomies/${branch}/${taxonomy_name}.zip 2>/dev/null

# create a fresh one
mkdir -p tmp
cd tmp
git clone git@github.com:$repository
cd ${repo_name}
echo `pwd`
echo ../../public/taxonomies/${branch}/${taxonomy_name} ${taxonomy_name}
zip -r ../../public/taxonomies/${branch}/${taxonomy_name} ${taxonomy_name}

cd ../..
ls -latr public/taxonomies/${branch}

ep=`python ./scripts/find_entrypoints.py tmp/${repo_name}/${taxonomy_name}`
packages=`python ./scripts/find_packages.py public/taxonomies/${branch}`

rm -rf tmp

echo ${ep}
echo ${packages}


arelleCmdLine --packages "${packages}"  --validate --file "${ep}"

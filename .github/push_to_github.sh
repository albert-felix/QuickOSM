#!/bin/sh

setup_git() {
  echo 'Setting up GIT account'
  git config --global user.email "etrimaille@3liz.com" # Email registered in the GitHub account
  git config --global user.name "3Liz bot"
  git checkout -b master
}

commit_processing_files() {
  echo 'Committing Processing documentation'
  make processing-doc
  git add docs/processing
  git commit --message "Update processing documentation to version : $TRAVIS_TAG" --message "[skip travis]"
}

commit_i18n_files() {
  echo 'Committing i18n files'
  git status
  git add QuickOSM/i18n/*.qm
  git commit --message "Update translations to version : $TRAVIS_TAG" --message "[skip travis]"
}

upload_files() {
  echo 'Git push'
  git remote add origin-push https://"${GH_TOKEN}"@github.com/"${TRAVIS_REPO_SLUG}".git > /dev/null 2>&1
  git push --quiet --set-upstream origin-push master
}

setup_git
commit_i18n_files
#commit_processing_files
upload_files

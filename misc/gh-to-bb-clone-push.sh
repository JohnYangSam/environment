# This script pulls down an repo from a Github url and
# pushes the entire repo to a Bitubucket url.

# User input
echo "Pull down an entire Github repo and push the entire repo to Bitbucket"

# Gett user input
echo "Github repo url:"
read GITHUB
echo "Bitbucket repo url:"
read BITBUCKET

<<COMMENTOUT1
# Take in commandline arguments
# Based on: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
  -gh|--github-ssh-url)
  GITHUB="$2"
  shift # past argument
  ;;
  -bb|--bitbucket-ssh-url)
  BITBUCKET="$2"
  shift # past argument
  ;;
  *)
      # unknown option
  ;;
esac
shift # past argument or value
done
COMMENTOUT1

# Prompt to continue or exit
# See: https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
read -r -p "Are you sure you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        # continue
        ;;
    *)
        exit 1
        ;;
esac

# Clone the github repo with the origin labeled as "github"
git clone --origin github $GITHUB

# Get the repo name from the GITHUB repo url
# See: https://stackoverflow.com/questions/9597751/using-match-to-find-substrings-in-strings-with-only-bash
REPO=`expr "$GITHUB" : '.*/\(.[^\.\/]*\)'`

# Enter the repo
cd $REPO

# Add the bitbucket remote
git remote add bitbucket $BITBUCKET

# Fetch and pull all branches from Github
# See: https://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all

# Push all branches to Bitbucket
# See: https://stackoverflow.com/questions/6865302/push-local-git-repo-to-new-remote-including-all-branches-and-tags
git push bitbucket '*:*'
git push bitbucket --all
git push bitbucket --tags

# You can do this all in one command with:
# git push REMOTE --mirror
# In addition --mirror, will also push your remotes, so this might not be exactly what you want.

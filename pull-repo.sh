user=$1
pass=$2
repo=$3
target=$4

echo "Cloning " $repo " ..."

mkdir -p $target/$repo
cd $target/$repo

#--- clone repo if directory still empty ---
if [ ! -d ".git" ]; then
	git clone https://$1:$2@github.com/TangereJs/$repo.git .
fi
git -c diff.mnemonicprefix=false -c core.quotepath=false fetch origin
#git -c diff.mnemonicprefix=false -c core.quotepath=false pull origin 0.8-preview
git -c diff.mnemonicprefix=false -c core.quotepath=false checkout -b 0.8-preview --track origin/0.8-preview
git -c diff.mnemonicprefix=false -c core.quotepath=false pull --no-commit origin 0.8-preview

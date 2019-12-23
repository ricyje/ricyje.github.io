src_repo=$(echo $PWD|xargs basename)
repo_sno_var=$(echo "$src_repo"'_SNO')
echo $repo_sno_var
def_branch=$(git symbolic-ref --short HEAD)
#git pull
dateline=$(date +'%F')
eval "SNO=\$$repo_sno_var"
if [[ "$SNO" == "" ]]
then
setx $repo_sno_var 0
fi
git worktree add -b \($SNO\)$def_branch/$dateline C:/CODE/$src_repo$SNO.$dateline $def_branch
let SNO++
setx $repo_sno_var $SNO
exit
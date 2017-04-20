
function gdirty() (
  local repos=(${*:1})
  
  for dir in "${repos[@]}"
  do
  (
    set -e
    cd $dir
    if [ -e .git ]
    then
      [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "$dir"
    fi
  ) 
  done
)

function guntracked() (
  local repos=(${*:1})
  
  for dir in "${repos[@]}"
  do
  (
    set -e
    cd $dir
    if [ -e .git ]
    then
      printf "$dir "
      expr `git status --porcelain 2>/dev/null| grep "^??" | wc -l` 
    fi
  ) 
  done
)

function whichbranch() (
  local repos=(${*:1})
  
  for dir in "${repos[@]}"
  do
  (
    set -e
    cd $dir
    if [ -e .git ]
    then
      printf "$dir: "
      git rev-parse --abbrev-ref HEAD
    fi
  ) 
  done
)

function gbranch() (
  local branchName
  local clean
  local "${1}"
  local "${2}" 
  local repos=(${*:3})
  
  if [ -z "$branchName" ]
  then
    echo "usage:  gbranch branchName=<git branch> clean=<true | false> [Repo1, Repo2...]"
    return 1
  fi
  if [ -z "$clean" ]
  then
    echo "usage:  gbranch branchName=<git branch> clean=<true | false> [Repo1, Repo2...]"
    return 1
  fi
  for dir in "${repos[@]}"
  do
  (
    cd $dir
    if [ -e .git ]
    then
      echo "***** $dir *****"
      if [ "$clean" == "true" ]
      then
        git checkout -- ./
      fi
      git fetch main > /dev/null
      git checkout $branchName
      if [ "$?" == "0" ]
      then
        git pull main $branchName
      else
        read -n1 -r -p "Press any key to continue..." key; echo
      fi
    fi
  )
  done
)

function gclone {
  if [ -z $1 ]
  then
    echo "usage:  gclone <repository>"
    exit
  fi

  git clone $MYGITHUB/$1.git
  (
    cd $1
    git remote add main $GITHUB/$1.git
    git fetch main
    git pull main master
  )
}

function gupdate {
  if [ -z $1 ] || [ -z $2 ]
  then
    echo "usage: gupdate <gitURL>|<gitRemoteAlias> <branch> [Repo1, Repo2...]"
    return
  fi
  
  for dir in ${@:3}
  do
    if [ -e $dir ] && [ -e $dir/.git ]
    then
      (
        cd $dir
        echo "***** $dir *****"
        git checkout $2
        git pull $1 $2
      )
    fi
  done
}

function gdelete {
  if [ -z $1 ]
  then
    echo "usage:  gdelete <branch name> [Repo1, Repo2...]"
    return 1
  fi
  pushd $PROJECTS > /dev/null
  for dir in ${@:2}
  do
    pushd $dir > /dev/null
      if [ -e .git ]
      then
        echo $dir
        git checkout master
        git pull main master
        git branch -D $1
      fi
    popd > /dev/null
  done
  popd > /dev/null
}

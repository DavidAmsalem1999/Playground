echo "A Single Word!"

# tarBranch=$(git branch -r --no-merged | grep -v master | grep -v developer | sed 's/origin\///')

# https://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
tarBranch=$(git branch -r --merged | grep -v master | sed 's/origin\///')
for branch in $tarBranch
    do
        echo $branch
        lastDate=$(git show -s --format=%ci origin/$branch)
        convertDate=$(echo $lastDate | cut -d' ' -f 1)
        Todate=$(date -d "$convertDate" +'%s')
        current=$(date +'%s')
        day=$(( ( $current - $Todate )/60/60/24 ))
        echo "last commit on $branch branch was $day days ago"
    #  if [ "$day" -gt 0 ]; then
    #     # git push origin :$branch
    #     # git checkout $branch
    #     # git checkout master
    #     # git branch -D $branch
    #     git push --delete origin $branch

    #     # echo "delete the old branch $branch"
    #  fi
    done
    
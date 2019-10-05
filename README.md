Steps for extracting files from one git repo into another:

1. Clone the original repo to a new location: `git clone $ORIGINAL /tmp/new-repo && cd /tmp/new-repo`
2. Break the connection from the original repo: `git remote remove origin`
3. Create a branch of the starting point for easy reference
   (git will actually do this for you, however I personally find it easier
   to work with filter-branch if I have my own branches for various states):
   `git branch original`
4. Work out which files you want to keep and adapt the `index-filter.sh` suitably (see comment inside it)
   Note: think about whether you want to keep things like the repo `README`, `LICENCE`, `.gitignore`, `.circleci/`
   etc. in addition to the actually interesting files. Often these are useful to keep too!
5. Run filter branch:
   `git filter-branch --prune-empty --force --index-filter /path/to/index-filter.sh --parent-filter /path/to/rewrite-common-parents.rb HEAD`
6. Check that you're happy with the files you have in the new repo. If you find
   that there are some you're missing, reset (`git reset --hard original`) and
   then go again from step 4.
7. Do any other manual tidyup you need to do (update the `README`, etc.)

Notes:
 * You _can_ put the filter scripts in the repo directory, however if they happen to conflict
   with names of anything in the repo (at any point in history), then weirdness could result.
 * The paths to the filter scripts need to be specified as absolute paths. I'm not entirely sure
   why, but `git` errors if you do otherwise. Using `$PWD` is an easy way to achieve this if
   you're being lazy (note that `./` does _not_ work).

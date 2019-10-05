#!/usr/bin/ruby

# From http://git.661346.n2.nabble.com/Removing-useless-merge-commit-with-filter-branch-tp7356544p7418753.html

# This script is the argument to --parent-filter and acts to remove merge commits
# where only one side of the merge has any commits. While this does remove potentially
# valid merges of feature branches onto `master`, the number of such "empty" merge
# commits which remain after running filter-branch means that removing them is usually
# desirable.

old_parents = gets.chomp.gsub('-p', '')

if old_parents.empty? then
  new_parents = []
else
  new_parents = `git show-branch --independent #{old_parents}`.split
end

puts new_parents.map{|p| '-p ' + p}.join(' ')

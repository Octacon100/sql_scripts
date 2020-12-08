git switch 'master'
git branch | %{ $_.Trim() } | ?{ $_ -ne 'master' } | %{ git branch -D $_ }
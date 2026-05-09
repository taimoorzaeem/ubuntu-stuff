# Github permalink generator
ghpermalink() {
  local remote=$1
  local file=$2
  local line=$3
  local upto=$4
  local commit=$(git rev-parse HEAD)
  local repo=$(git remote get-url $remote \
    | sed 's/git@github.com://;s/\.git$//')
  local lineref="${line:+#L$line}${upto:+-L$upto}"
  echo "$repo/blob/$commit/$file$lineref"
}

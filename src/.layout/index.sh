#!/bin/bash

# Break apart the LIST payload
IFS='✂︎' read -r -a array <<< "$LIST"

source .layout/functions.sh


function index_loop {
	for (( idx=${#array[@]}-1 ; idx>=0 ; idx-- )) ; do
    [ "${array[idx]}" ] && eval "${array[idx]} list_item"
  done
}

function list_item {
  if [ -z "$BREAK" ]; then
cat << _LOOP_
  <li class="post-link"><a href="$(echo $POST_URL)"><span class="stamp">$(get-my-date-format $POST_DATE_RFC822)</span> <span class="title">$(echo $POST_TITLE)</span></a></li>
_LOOP_
#  else
#cat << _LOOP_
#  <li class="post-link"><a href="/page/$(echo $BREAK).html">In page $(echo $BREAK)</a></li>
#_LOOP_
  fi
}

function nav {
	if [ "$PAGE_OLD" ] || [ "$PAGE_NEW" ]; then
cat << _NAV_
    <nav>
			$([ "$PAGE_NEW" ] && echo "<a href=\"$PAGE_NEW\">← NEWER</a>")
			$([ "$PAGE_OLD" ] && echo "<a href=\"$PAGE_OLD\">OLDER →</a>")
		</nav>
_NAV_
	fi
}

# render header/footer markdown

cat << _EOF_
<!DOCTYPE html>
<html>
  $(envsubst < .templates/index-header.html > /dev/stdout)
  $($MARKDOWN_COMMAND .templates/index-header.md | envsubst > /dev/stdout)
  <body>
    <div class="wrap">
      $(if [ "$TAGNAME" ]; then echo "<header><a href=\"/tag/$TAGNAME\">TAG: $TAGNAME</a></header>"; fi)
      <ul class="posts">
  			$(index_loop)
      </ul>
  		$(nav)
    </div>
  </body>
  <footer>
  $($MARKDOWN_COMMAND .templates/index-footer.md | envsubst > /dev/stdout)
  </footer>
</html>
_EOF_

#!/bin/bash

source .layout/functions.sh

cat << _EOF_
<!DOCTYPE html>
<html>
  $(envsubst < .templates/post-header.html > /dev/stdout)
  <!-- $($MARKDOWN_COMMAND .templates/post-header.md | envsubst > /dev/stdout) -->
  <body>
    <div class="wrap">
      <article>
      <div class="heading"><a href="${POST_URL}"><span class="stamp">$(get-my-date-format $POST_DATE_RFC822)</span> <span class="title">${POST_TITLE}</span></a></div>
        <a href="/" class="home">←</a><div class="contents">
        $(echo "$POST_CONTENTS")
        <div class="tags">$(for i in $TAGS; do echo "<a href=\"/tag/$i\">$i</a>"; done;)</div>
        </div>
      </article>
    </div>
  </body>
  <footer>
  $($MARKDOWN_COMMAND .templates/post-footer.md | envsubst > /dev/stdout)
  </footer>
</html>
_EOF_

#!/bin/bash

MARKDOWN_COMMAND="awk -f /usr/local/share/jenny/lib/md2html.awk"

function get-my-date-format {

  POST_DATE_RFC822="$@"
  echo $POST_DATE_RFC822 | date +%Y%m%d

}

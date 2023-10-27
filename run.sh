#!/bin/sh

test -z "$1" && ! test -f usage.db && echo "Missing Usage Report .csv" && exit 1

# Prepare database a new usage report has been supplied
test -f "$1" && ./usage-report2sql.sh $@

# Start dashboard when database has been prepared
datasette --reload usage.db --metadata metadata.yml --setting max_returned_rows 200000

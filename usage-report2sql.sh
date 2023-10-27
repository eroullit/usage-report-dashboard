#!/bin/sh

! test -f "$1" && exit 1

> usage.db

for i in $@
do
    sqlite-utils insert usage.db usage "$i" --csv --detect-types
done

# Add a dedicated price column and calculate a per-item price
sqlite-utils add-column usage.db usage price float
sqlite-utils usage.db 'UPDATE usage SET Price = (Quantity * "Price Per Unit ($)" * Multiplier)'

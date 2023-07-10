#!/bin/sh

! test -f "$1" && exit 1

sqlite-utils insert usage.db usage "$1" --csv --detect-types

# Add a dedicated price column and calculate a per-item price
sqlite-utils add-column usage.db usage price float
sqlite-utils usage.db 'UPDATE usage SET Price = (Quantity * "Price Per Unit ($)" * Multiplier)'
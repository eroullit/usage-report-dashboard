#!/bin/sh

sqlite-utils insert usage.db usage "$1" --csv --detect-types

# Add a dedicated price column and calculate a per-item price
sqlite-utils add-column usage.db usage price float --not-null-default 0.0
sqlite-utils usage.db 'UPDATE usage SET Price = (Quantity * "Price Per Unit ($)" * Multiplier)'
#!/bin/sh

sqlite-utils insert usage.db usage "$1" --csv --detect-types
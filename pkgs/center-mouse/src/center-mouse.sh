#!/usr/bin/env bash

# Source: https://github.com/i3/i3/issues/2971#issuecomment-365268904

XDT="/usr/bin/env xdotool"

WINDOW="$($XDT getwindowfocus)"

# this brings in variables WIDTH and HEIGHT
eval "$(xdotool getwindowgeometry --shell "$WINDOW")"

TX=$((WIDTH / 2))
TY=$((HEIGHT / 2))

$XDT mousemove -window "$WINDOW" "$TX" "$TY"

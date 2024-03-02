#!/bin/bash

LeibnizTurbo() {
    local iterations=$1
    local n=1
    local topterm=-1.0
    for ((i=2; i<iterations-1; i++)); do
        local bottomterm=$((i << 1)) # Fast bitwise x2
        local term=$(echo "$topterm / ($bottomterm - 1.0)" | bc -l)
        n=$(echo "$n + $term" | bc -l)
        topterm=$(echo "-1.0 * $topterm" | bc -l) # Flip top between 1 and -1
    done
    echo "$n * 4" | bc -l
}

echo "Starting Leibniz Approximation"
result=$(LeibnizTurbo 1000)
echo "$result"


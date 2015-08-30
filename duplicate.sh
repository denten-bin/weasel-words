#!/bin/bash

# find duplicate words
grep -Eo '(\b.+) \1\b'

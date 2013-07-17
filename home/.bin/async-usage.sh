#!/bin/sh

ack-grep "async\.[a-zA-Z]+" -h -o | sort | uniq -c | sort -n

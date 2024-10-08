#!/usr/bin/env bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"

until nc -z "$host" 2>/dev/null; do
  >&2 echo "Waiting for $host to be available..."
  sleep 1
done

>&2 echo "$host is available - executing command"
exec $cmd
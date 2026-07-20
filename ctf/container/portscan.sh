#!/usr/bin/env bash
# scan-1-5000.sh
# Basic port scanner for ports 1..5000 using /dev/tcp and timeout
# Usage: ./scan-1-5000.sh 10.0.0.5
# Note: Requires `timeout` (coreutils). No root required for TCP connect checks.

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <IP-or-hostname> [concurrency]"
  exit 2
fi

TARGET="$1"
CONCURRENCY="${2:-200}"   # default parallel jobs
TIMEOUT_SECS=0.1           # seconds to wait for a connection attempt

# sanity checks
if ! command -v timeout >/dev/null 2>&1; then
  echo "This script requires 'timeout' (coreutils). Install it or use a system with it." >&2
  exit 3
fi

# worker: test a single port
scan_port() {
  local ip="$1"
  local port="$2"

  # Try to open TCP connection using bash /dev/tcp in a timeout wrapper.
  # Redirect stdout/stderr away; we only care about success (exit code 0).
  if timeout "${TIMEOUT_SECS}" bash -c ">/dev/tcp/${ip}/${port}" >/dev/null 2>&1; then
    printf "%s\n" "${port}"
  fi
}

export -f scan_port

# Use a simple job queue with backgrounded workers limited by CONCURRENCY.
# This is intentionally simple and POSIX-friendly.
open_ports=()
pids=()
jobcount=0

for port in $(seq 1 5000); do
  # launch scan in background
  scan_port "$TARGET" "$port" &
  pids+=($!)
  jobcount=$((jobcount+1))

  # if we've reached concurrency limit, wait for any job to finish
  if [ "$jobcount" -ge "$CONCURRENCY" ]; then
    # wait for the first background job to finish to free a slot
    wait -n 2>/dev/null || wait "${pids[0]}" 2>/dev/null || true

    # prune finished PIDs from array (keep it small)
    newpids=()
    for pid in "${pids[@]}"; do
      if kill -0 "$pid" 2>/dev/null; then
        newpids+=("$pid")
      fi
    done
    pids=("${newpids[@]}")
    jobcount="${#pids[@]}"
  fi
done

# wait for remaining jobs
wait

# Because workers print only the port number, collect and sort them for output.
# We re-run the scan but redirect results to a temporary file in the loop above would be cleaner;
# to keep the script short, re-run a lightweight check to gather open ports:
tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

for port in $(seq 1 5000); do
  if timeout "${TIMEOUT_SECS}" bash -c ">/dev/tcp/${TARGET}/${port}" >/dev/null 2>&1; then
    echo "$port" >> "$tmpfile"
  fi
done

if [ ! -s "$tmpfile" ]; then
  echo "No open ports found in range 1-5000 on ${TARGET} (within ${TIMEOUT_SECS}s per port)."
  exit 0
fi

echo "Open ports on ${TARGET}:"
sort -n "$tmpfile" | uniq | xargs -r printf '%s\n'

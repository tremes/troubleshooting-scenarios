#!/bin/bash
set -e

echo "Scenario 01 — Payments API Failure"
echo ""
echo "=== Fixing probes on reconciliation-service ==="
oc set probe deployment/reconciliation-service -n payments \
  --readiness --open-tcp=8080 --initial-delay-seconds=3 --period-seconds=5 --failure-threshold=3
oc set probe deployment/reconciliation-service -n payments \
  --liveness --open-tcp=8080 --initial-delay-seconds=3 --period-seconds=5 --failure-threshold=3

oc -n payments rollout status deployment/reconciliation-service --timeout=120s

echo ""
echo "Done. reconciliation-service is running normally."

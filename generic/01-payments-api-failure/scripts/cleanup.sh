#!/bin/bash
set -e

echo "Scenario 01 — Payments API Failure"
echo ""
echo "=== Deleting namespaces ==="
oc delete namespace payments --ignore-not-found --wait

echo ""
echo "Done. All resources removed."

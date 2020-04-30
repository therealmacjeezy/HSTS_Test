#!/bin/bash

if [[ -z "$1" ]]; then
        echo "Missing Hostname to Check.."
        echo "Example: HSTSTest.sh 'https://hostname.goes.here'"
        echo ""
        echo "exiting.."
        exit 1
else
        HOSTNAME="$1"
fi

HSTS_TEST() {
        CHECK_HSTS=$(curl -s -D- "$HOSTNAME" | grep -i Strict)
        
        if [[ -z "$CHECK_HSTS" ]]; then
                HSTS_RESULTS="HSTS Not Configured"
        else
                HSTS_RESULTS="$CHECK_HSTS"
        fi
}

echo "Checking HSTS for $HOSTNAME..."
echo " "
HSTS_TEST
echo "--------------------------------------------------------------"
echo "$HSTS_RESULTS"
echo "--------------------------------------------------------------"

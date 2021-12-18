#!/bin/bash
grep -i "04:00:00 PM" 0310_Dealer_schedule > Test_filter_logs
awk -F" " '{print $1, $2, $5, $6}' Test_filter_logs >> Test_roulette_dealer_finder_by_time


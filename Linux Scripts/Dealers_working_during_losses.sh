#!/bin/bash
grep -i "02:00:00 PM" 0315_Dealer_schedule > filter_logs
awk -F" " '{print $1, $2, $5, $6}' filter_logs >> Dealers_working_during_losses

#!/bin/sh
#script to keep ssh server alive through dhcp renewals
nohup $(ping www.google.com &>/dev/null) > /dev/null &

#!/bin/sh

echo $FLAG > /home/ctf/flag 

export $FLAG=no_flag
FLAG=no_flag

supervisord -c /super.conf;
sleep infinity;
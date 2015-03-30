#! /usr/bin/env bash

#Usage
if [ $# -ne 1 ]   
  then  
    echo "usage:  $0 <filename>"   
    exit 
fi

# Checking for file existence
if [ ! -f  $1 ]
  then
    echo "File not found!"
    exit
fi

codes=1000
response_count=0

get_http_codes() {
codes=`grep HTTP $1 | awk '{print $10}' | sort | uniq`
}

error_count() {
response_count=`grep HTTP $1 | grep $2 | wc -l`
}

# Fetching unique HTTP codes
get_http_codes $1
echo  "HTTP codes found in this log are: ";
echo -e "$codes\n"


# Getting count of error of each HTTP response code
echo "The HTTP response code count is as follows:"
for i in $codes;
  do error_count $1 $i;echo  "$i:  $response_count"
done

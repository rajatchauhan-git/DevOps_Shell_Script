#!/bin/bash

# Function to display usage information
usage() {
        echo "Usage: $0 /home/ubuntu/logs/days.log"
        exit 1
}

if [ $# -ne 1 ]; then
        usage
fi

log_file=$1

# Check if the log file is a valid regular file
if [ ! -f "$log_file" ]; then
        echo "Error: log file $log_file does not exist."
        exit 1
fi

# Variables defined
error_keyword="ERROR"
critical_keyword="CRITICAL"
date=$(date +"%Y-%m-%d")
summary_report="summary_report_$date.txt"
archive_dir="processed_logs"
total_lines=$(wc -l < "$log_file")

# Create summary report
{
        echo "Date of analysis: $date"
        echo "Log file name: $log_file"
        echo "Total lines in the log file: $total_lines"
} > "$summary_report"

# Total error count
error_count=$(grep -c "$error_keyword" "$log_file")
echo "Total error count: $error_count" >> "$summary_report"

# Get the list of critical events with line number
critical_events=$(grep -n "$critical_keyword" "$log_file")
echo "List of critical events with line number:" >> "$summary_report"
echo "$critical_events" >> "$summary_report"

# Extract error messages, count occurrences, sort by frequency, and display the top 5
top_five=$(grep -i "$error_keyword" "$log_file" | awk '{print $1,$2,$3,$4,$5}' | sort | uniq -c | sort -nr | head -n 5)
echo "Top 5 error messages with their occurrence count:" >> "$summary_report"
echo "$top_five" >> "$summary_report"

#grep -i Searches for lines containing the word error (case insensitive) in the log file.
#sort: Sorts the lines to prepare them for counting unique occurrences
#uniq -c: Counts the unique occurrences of each line
#sort -nr: Sorts the counted occurrences in numeric order (descending).
#head -n 5: Displays the top 5 lines

LOG_FILE_PATH = "/home/luke/performance_tracker_log.log"

FIELD_SEPARATOR = "-----"

logline = ""
logline << Time.now.to_s
logline << FIELD_SEPARATOR


# get cpu usage and add it to the logline
result = `uptime`

logline << result.scan(/load average: .*/)[0]
logline << FIELD_SEPARATOR

# get memory usage
result = `free -m`

logline << "Mem: "
logline << result.scan(/Mem:\s+(\d+)\s+(\d+)\s+(\d+)/)[0].join('/')
logline << FIELD_SEPARATOR

logline << "Swap: "
logline << result.scan(/Swap:\s+(\d+)\s+(\d+)\s+(\d+)/)[0].join('/')

logline << "\n"

logfile = File.open(LOG_FILE_PATH, 'a')
logfile.write(logline)
logfile.close



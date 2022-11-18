:<<DOC
Convert a file in the following format to Ansible YAML:
# List of hosts, tagged by group
macmini2:servers
raspberrypi:servers
dmaf5:desktops
mac-pro-1-1:desktops
DOC
scriptPath=$(dirname $0)
SCRIPT=$(/usr/bin/basename $0)
echo "scriptPath: $scriptPath"
echo "Mi archivo es: ${SCRIPT}"

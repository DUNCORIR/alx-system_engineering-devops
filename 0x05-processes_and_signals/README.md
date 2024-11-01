0x05. Processes and signals

0. Understanding Processes

Processes are instances of running programs with unique Process IDs (PIDs).
Commands like ps, top, and htop are useful to view active processes and their statuses.
Foreground vs. Background Processes: Using & to run processes in the background and fg to bring them to the foreground.

1. Signals

Signals are ways to control processes, like interrupting, pausing, or terminating them.
Common signals:
SIGINT (Interrupt - Signal 2): Sent by pressing Ctrl+C.
SIGTERM (Terminate - Signal 15): Requests a process to terminate gracefully.
SIGKILL (Kill - Signal 9): Forcefully kills a process and cannot be ignored.
SIGHUP (Hangup - Signal 1): Often used to reload configurations.
Use kill, pkill, or killall to send signals to processes by PID or by name.

2. Basic Commands and Tools

ps: View running processes (e.g., ps aux or ps -ef for detailed views).
top: Real-time view of processes and resource usage.
kill: Send signals to processes by PID (e.g., kill -9 <PID> to force-kill).
pkill: Terminate processes by name (e.g., pkill process_name).
sleep: Pause execution for a specified amount of time (useful for testing signals).

3. Manual Pages (man or help)
ps: Displays information about running processes.

Example: ps aux lists all processes with details like PID, user, CPU, and memory usage.
pgrep: Searches for processes by name and returns their PIDs.

Example: pgrep bash finds PIDs for all bash processes.
pkill: Similar to pgrep but used to send signals to processes by name.

Example: pkill -9 chrome force-kills all Chrome processes.
kill: Sends a signal to a process by PID.

Example: kill -15 <PID> for graceful termination, or kill -9 <PID> to forcefully terminate.
exit: Exits the current shell or script. Optionally takes an exit code.

Example: exit 0 to exit successfully, or exit 1 for an error.
trap: Defines actions to take when a script receives a specific signal.

Example: trap "echo 'Interrupt signal received'" SIGINT will catch the SIGINT signal and print a message.

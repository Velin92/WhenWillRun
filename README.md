# WhenWillRun

A basic Command Line Tool without the use of any library (even Foundation is not used) to check when a given task will run for the first time.
To run it it's also possible to use the executable included in the BUILD folder or simply by checking the releases on the git.

To run it simply type ./WhenWillRun <simulated time in HH:MM format> in the folder where the executable is stored.
Example: ./WhenWillRun 13:44

And then provide for each line the task scheduling (minute first and then hour) and the name, for the scheduling values the "*" character is a wild card, that means any minute/hour
Examples:
30 1 /bin/run_me_daily
45 * /bin/run_me_hourly
* * /bin/run_me_every_minute
* 19 /bin/run_me_sixty_times

To conclude the input sequence insert the EOF character (CTRL+D on Mac).
Alternatively, the command can be run by using cat from a file containing the inputs, and then chaining it with a "|" operator on the tool

Example:
cat input.txt | ./WhenWillRun <simulated current time>

# log_file = open("um-server-01.txt") #This can open a file in Python. This variable will be used as the data for the for in loop below and shortens the code.


# def sales_reports(log_file): # a function is being defined and connects the file to this problem.
#     for line in log_file: # this for in loop loops over each line in the file.
#         line = line.rstrip() # line is the variable for the rstrip method that removes any trailing characters
#         day = line[0:3] # variable day is equal to line [0:3], getting all that data
#         if day == "Tue": # if statement saying if day equals 'Tues'
#             print(line) # finishing the if statement to print the variable 'line' if the statement is equal to 'Tues'


# sales_reports(log_file) # invoking the function and making it run through the file and print the results


# Change the script to display sales info for Monday instead of Tuesday.

log_file = open("um-server-01.txt")

def sales_reports(log_file):
    for line in log_file:
        line = line.rstrip()
        day = line[0:2]
        if day == "Mon":
            print(line)

sales_reports(log_file)
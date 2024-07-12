import readline
readline.write_history_file = lambda *args: None

def clear():
	from os import system
	system("clear")

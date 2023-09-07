from sys import argv
import os

# if the mode has an underscore in front
# the script will remove the mode
SIGNAL = '_'


def is_mode_activated(target_str: str) -> bool:
    try:
        with open(MODES_FILE_PATH, 'r') as file:
            content = file.read()
            if target_str.upper() in content:
                return True
            else:
                return False
    except FileNotFoundError:
        return False


def get_line(search_str: str) -> int:
    """
    Grab the line number containing the search string.
    If not found, return None
    """
    with open(MODES_FILE_PATH, 'r') as file:
        lines = file.readlines()

    for i, line in enumerate(lines, start=1):
        if search_str in line:
            return i
    return None


def deactivate_mode(mode: str):
    line_num = get_line(f"{mode.upper()}")

    if line_num is not None:
        with open(MODES_FILE_PATH, 'r') as file:
            lines = file.readlines()

        filtered_lines = [
            line for i, line in enumerate(lines, start=1)
                if i not in [line_num, line_num + 1]
        ]

        with open(MODES_FILE_PATH, 'w') as file:
            file.writelines(filtered_lines)


def activate_mode(mode: str):
    with open(MODES_FILE_PATH, 'a') as file:
        file.write(f"# {mode.upper()}\nsource $zsh_dir/modes/{mode_to_path[mode]}\n")
        print(f"{mode} is now activated")


def activate_modes(*args: str):
    """
    Iterates through each argument passed in by user.
    Activating or deactiving the mode if the mode exists
    """
    for arg in args:
        if arg in mode_to_path:
            if is_mode_activated(arg):
                print(f"{arg} is already activated")
            else:
                activate_mode(arg)
        else:
            if arg[0] == SIGNAL and arg[1:] in mode_to_path:
                deactivate_mode(arg[1:])



# The modes available and there where they're located in modes dir
mode_to_path={
    "conda": "./conda.zsh",
    "nvm": "./nvm.zsh",
}


# The first argument will be passed by the command (~/.zshrc)
MODES_FILE_PATH = argv[1]

# Every other argument after that will be a mode declared by the user
if len(argv) > 2:
    args = argv[2:]
    activate_modes(*args)
else:
    if os.path.exists(MODES_FILE_PATH):
        os.system(f"cat {MODES_FILE_PATH}")
    else:
        with open(MODES_FILE_PATH, 'w') as file:
            file.write("")

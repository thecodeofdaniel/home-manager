import os


def find_string_line(filename, target_str) -> int:
    with open(filename, 'r') as filename:
        for i, line in enumerate(filename, 1):
            if target_str in line:
                return i
    return -1


def delete_lines(filename, start, end) -> None:
    with open(filename, 'r') as file:
        lines = file.readlines()

    # Create a new list without the lines to delete
    updated_lines = [
        line for i, line in enumerate(lines, 1) if not (start <= i <= end)
    ]

    with open(filename, 'w') as file:
        file.writelines(updated_lines)


def add_string(filename, line_num, str) -> None:
    with open(filename, 'r') as file:
        lines = file.readlines()

    # Adjust the line_number to be zero-based (line_number-1) for list indexing
    index_to_insert = line_num - 1

    # Insert the string with tabs at the specified line
    lines.insert(index_to_insert, str)

    with open(filename, 'w') as file:
        file.writelines(lines)

def grab_info():
    global GIT_NAME
    global GIT_EMAIL

    GIT_NAME  = input("Enter your name for git:  ")
    GIT_EMAIL = input("Enter your email for git: ")


# Grab user info
NAME = os.environ["USER"]
grab_info()

dict = {
    "home.nix": [
        [
            "home.username = ",
            f"  home.username = \"{NAME}\";\n"
        ],
        [
            "home.homeDirectory = ",
            f"  home.homeDirectory = \"/home/{NAME}\";\n"
        ]
    ],

    "flake.nix": [
        [
            "myname = ",
            f"      myname = \"{NAME}\";\n"
        ]
    ],

    "./programs/git.nix": [
        [
            "userEmail =",
            f"  userEmail = \"{GIT_EMAIL}\";\n"
        ],
        [
            "userName =",
            f"  userName = \"{GIT_NAME}\";\n"
        ]
    ]
}


expected_dir = f"/home/{NAME}/.config/home-manager"
curr_dir = os.getcwd()

if curr_dir != expected_dir:
    print("Please run the script from the correct directory:", expected_dir)
else:
    for filename, str_list in dict.items():
        for str in str_list:
            target_str = str[0]
            replace_str = str[1]
            line_num = find_string_line(filename, target_str)
            delete_lines(filename, line_num, line_num)
            add_string(filename, line_num, replace_str)

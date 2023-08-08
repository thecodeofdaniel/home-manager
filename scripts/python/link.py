import subprocess

pkgs = [
    "bat",
    "fzf", # search through history with <ctrl> + r
    "git",
    "tmux",
    "trash-cli",
    "tree",
    "vscode",
    "xsel", # for tmux plugin yank
    "zoxide", # using fzf when cd'ing
]

for pkg in pkgs:
    # Use Popen instead of run to allow interaction with the subprocess
    location_process = subprocess.Popen(f"which {pkg}", shell=True, stdout=subprocess.PIPE, text=True)
    location, _ = location_process.communicate()

    # Use strip() to remove any extra whitespace, newline, etc. from the location path
    location = location.strip()

    if location:
        command = f"sudo ln -s {location}* /root/.nix-profile/bin"
        subprocess.run(command, shell=True)
    else:
        print(f"{pkg} not found. Skipping symlink creation.")

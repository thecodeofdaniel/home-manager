# How to get Started!

- Install Nix

    ```
    sh <(curl -L https://nixos.org/nix/install) --daemon
    ```

- Allow nix flakes

    ```
    mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
    ```

- Clone the repo

    ```
    git clone <name_of_this_repo> ~/.config/home-manager
    ```

- Run the python script. This will replace my name with your's

    ```
    python replace.py
    ```

- Run the following

    ```
    nix run home-manager/release-23.05 -- init --switch
    ```

    - If there is a error when installing. Try this fix and run the command above again

      ```
      mkdir -p ~/.local/state/nix/profiles
      ```

- Run the build script

    ```
    ./build.sh
    ```

## If you want to uninstall home-manager

- Run the following

    ```
    home-manager uninstall
    ```

- Run garbage collection

    ```
    nix-collect-garbage -d
    ```

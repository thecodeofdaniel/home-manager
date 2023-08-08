{
  enable = true;

  userEmail = "thecodeofdaniel+github@gmail.com";
  userName = "thecodeofdaniel";

  extraConfig = {
    core = {
      editor = "code --wait";
    };

    init = {
      defaultBranch = "main";
    };

    submodule = {
      recurse = true;
    };
  };
}
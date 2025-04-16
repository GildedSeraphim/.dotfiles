{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./starship.nix
    ./zoxide.nix
    ./direnv.nix
    ./tmux.nix
    ./eza.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    pfetch
    onefetch
  ];

  programs.fish.enable = true;

  xdg.configFile."fish/functions/fish_greeting.fish".text = ''
    function fish_greeting
        echo '                 '(set_color F00)'___
      ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
    /T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')    '(set_color F00)(whoami)'@'(hostname)'
    [ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')'(set_color yellow)'    Uptime: '(set_color dfaf87)(uptime | sed 's/.*up \([^,]*\), .*/\1/')(set_color red)'
     \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')    CWD: '(set_color dfaf87)(pwd)(set_color red)'
      \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)     '(set_color yellow)'λ Nixing It Up? λ '(set_color dfaf87)yes(set_color red)'
       \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\    '(set_color F00)'Battery Percentage: '(set_color dfaf87)(acpi | grep -o '[0-9]*%' -m 1)'
       '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
      (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
      '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
       '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
              '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                          '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                          (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                           (UU)'(set_color normal)
    end
  '';

  programs.fish.shellInit = '''';

  programs.fish.shellAliases = {
    l = "eza -al";
    cd = "z";
    ls = "eza";
    ll = "eza -l";
    ".." = "cd ..";
    "dot" = "cd /home/sn/.dotfiles/";
    "neo" = "nitch";
    "cl" = "clear";
    "fui" = "nix run github:vimjoyer/nix-update-input";
    "nt" = "nix-tree";
    "dl" = "cd $HOME/Downloads";
    "doc" = "cd $HOME/Documents";
    "develop" = "nix develop --command fish";
    "vpn-on" = "systemctl start wg-quick-wg0";
    "vpn-off" = "systemctl stop wg-quick-wg0";
    "activateLinux" = "nix run github:MrGlockenspiel/activate-linux";
    "please" = "sudo";
  };

  programs.fish.shellAbbrs = {
    "zj" = "zellij";
  };
}

case platform
when "mac_os_x"
  default[:dotfiles] = {
    user: "levi",
    group: "staff",
    home_path: "/Users/levi"
  }
else
  default[:dotfiles] = {
    user: "levi",
    group: "levi",
    home_path: "/home/levi"
  }
end

case profile
when "work"
    case platform
    when "mac_os_x"
        default[:dotfiles] = {
            user: "levi.smith",
            group: "levi.smith",
            home_path: "/Users/levi.smith"
        }
    else
        default[:dotfiles] = {
           user: "levi.smith",
           group: "levi.smith",
           home_path: "/home/levi.smith"
        }
   end
when "personal"
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
else
    case platform
    when "mac_os_x"
        default[:dotfiles] = {
            user: "vagrant",
            group: "vagrant",
            home_path: "/Users/vagrant"
        }
    else
        default[:dotfiles] = {
           user: "vagrant",
           group: "vagrant",
           home_path: "/home/vagrant"
        }
    end
end

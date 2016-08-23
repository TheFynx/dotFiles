case platform
when "mac_os_x"
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "staff",
    profile["home"] "/Users/levi"
  end

when "windows"
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "levi",
    profile["home"] "/home/levi"
  end
else
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "levi",
    profile["home"] "/home/levi"
  end
end



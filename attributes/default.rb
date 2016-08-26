case platform
when "mac_os_x"
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "staff",
    profile["home"] = "/Users//#{node["dotfiles"]["profile"]["user"]}"
  end

when "windows"
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "levi",
    profile["home"] = "C:/users/#{node["dotfiles"]["profile"]["user"]}"
  end
else
  default["dotfiles"].tap do |profile|
    profile["group"] = "levi",
    profile["group"] = "levi",
    profile["home"] = "/home//#{node["dotfiles"]["profile"]["user"]}"
  end
end



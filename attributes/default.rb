case platform
when "mac_os_x"
  default["dotfiles"]["profile"].tap do |profile|
    profile["user"] = "levi",
    profile["group"] = "staff",
    profile["home"] = "/Users/#{node["dotfiles"]["profile"]["user"]}"
  end

when "windows"
  default["dotfiles"]["profile"].tap do |profile|
    profile["user"] = "levi",
    profile["group"] = "levi",
    profile["home"] = "C:/users/#{node["dotfiles"]["profile"]["user"]}"
  end
else
  default["dotfiles"]["profile"].tap do |profile|
    profile["user"] = "levi",
    profile["group"] = "levi",
    profile["home"] = "/home/#{node["dotfiles"]["profile"]["user"]}"
  end
end


default["dotfiles"]["docker"].tap do |docker|
  docker["user"] = "thefynx"
end


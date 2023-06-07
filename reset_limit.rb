# Makes sure your loop limit matches the exact size of the fortune list.
def reset_limitation
  fortune_cookie1 = File.readlines("_ai/fortunes/set_one/futures.txt")

  loop_resizer = fortune_cookie1.size.to_i

  open("_ai/gen_limit/limitation.txt", "w") { |f|
    f.puts loop_resizer
  }
end

reset_limitation

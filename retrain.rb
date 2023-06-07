def retrain_model
  new_fortune = File.read("_outcomes/remembered_futures/fortune.txt")

  open("_ai/fortunes/set_one/futures.txt", "w") { |f|
    f.puts new_fortune
  }

  open("_ai/fortunes/set_two/futures.txt", "w") { |f|
    f.puts new_fortune
  }

  puts ">> Reset fortune list for each set as remembered futures."
end

## This function is both a form of remembering fortunes and unlearning out of date fortunes.
retrain_model

def fortune_generation
  iteration = Fiile.read("_ai/gen_limit/limitation.txt").strip.to_i

  iteration.times do
    # Make fortunes cookies by two future array clones.
    fortune_cookie1 = File.readlines("_ai/fortunes/set_one/futures.txt")
    fortune_cookie2 = File.readlines("_ai/fortunes/set_two/futures.txt")

    # Use sampler for each fortune cookie
    first_outcome  = fortune_cookie1.sample.strip
    second_outcome = fortune_cookie2.sample.strip

    if first_outcome == second_outcome
      puts "First fortune: #{first_outcome} Second fortune: #{second_outcome}"

      puts ">> These outcomes are similar and thus remembering these for later..."

      ## Create a new document based on remembered datapoint
      open("_outcomes/remembered_futures/fortune.txt", "a") { |f|
        f.puts first_outcome
      }
    else
      puts "First fortune: #{first_outcome} Second fortune: #{second_outcome}"

      puts ">> These outcomes are not similar and thus must be unconnected..." 
    end
  end
  
  fortune_generation

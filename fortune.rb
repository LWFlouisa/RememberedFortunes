def fortune_generation
  iteration = File.read("_ai/gen_limit/limitation.txt").strip.to_i

  iteration.times do
    # Make fortunes cookies by two future array clones.
    fortune_cookie1 = File.readlines("_ai/fortunes/set_one/futures.txt")
    fortune_cookie2 = File.readlines("_ai/fortunes/set_two/futures.txt")

    # Use sampler for each fortune cookie
    first_fortune  = fortune_cookie1.sample.strip
    second_fortune = fortune_cookie2.sample.strip
    outcome_name   = "result".tr " ", "_"

    if first_fortune == second_fortune
      puts "First fortune: #{first_fortune} Second fortune: #{second_fortune}"

      puts ">> These outcomes are similar and thus remembering these for later..."

      ## Create a new document based on remembered datapoint
      open("_outcomes/remembered_futures/fortune.txt", "a") { |f|
        f.puts first_fortune
      }

      ## Create a new prolog knowledge base section upon appending.
      open("_knowledgebase/#{outcome_name}.pl", "a") { |f|
        f.puts first_fortune
      }

      abort
    else
      puts "First fortune: #{first_fortune} Second fortune: #{second_fortune}"

      puts ">> These outcomes are not similar and thus must be unconnected..." 
    end
  end
end
  
fortune_generation

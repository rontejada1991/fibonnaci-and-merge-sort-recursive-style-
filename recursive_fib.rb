def fibs(numbers, result=[0, 1])
  if numbers == 0
    return [0]
  elsif numbers == 1
    return result
  end

  while result.length < numbers
    result << result[-1] + result[-2]
  end

  return result
end

def fibs_rec(max, result=[0, 1])
  # Cases for when we get 0 or 1 as our max for our sequence
  case max
  when 0 then return [0]
  when 1 then return result # ==> [0, 1]
  end

  return result if max == 2 # [0, 1] is already done
  result << result[-1] + result[-2]
  return fibs_rec(max-1, result)
end

def merge_sort_rec(array, container = [])
  if array.size == 0

    container.each_index do |i|
      if i % 2 == 0
        first, second = container[i], container[i+1]              
        merged = []

        if second.nil?
          break
        end

        puts "i: #{i}, i+1: #{i+1}, first: #{first}, second: #{second}, container: #{container}"
        until first.empty? && second.empty?
          if first.empty?
            second.each do |e| merged << second.shift end
          elsif second.empty?
            first.each do |e| merged << first.shift end
          else
            if first[0] < second[0]
              merged << first.shift
            else
              merged << second.shift
            end
          end
        end
        container << merged
      end
    end
    container.flatten!
    return container
  else
    container << [array.shift]
    merge_sort_rec(array, container)
  end
end

puts "fibonnaci using iteration: "
puts fibs(0).inspect
puts fibs(1).inspect
puts fibs(3).inspect
puts fibs(5).inspect
puts fibs(8).inspect

puts "fibonnaci using recursion: "
puts fibs_rec(0).inspect
puts fibs_rec(1).inspect
puts fibs_rec(3).inspect
puts fibs_rec(5).inspect
puts fibs_rec(8).inspect

puts "merge sort using recursion: "
puts "original: #{[20, 98, 2, 10, 55, 83, 22, 35].inspect}"
puts merge_sort_rec([20, 98, 2, 10, 55, 83, 22, 35]).inspect
require "csv"
require 'google/apis/civicinfo_v2'
require 'erb'

answers_given = 0;
correct_answers = 0;



contents = CSV.open "quiz.csv" , headers: true, header_converters: :symbol
thread1 = Thread.new do
         contents.each do |row|
         q =  row[:questions]
         puts q
         a = row[:answers]
         ans = gets.chomp
         answers_given = answers_given+1
         correct_answers = correct_answers+1  if (a == ans)
end
end
time_allowed = 180
start_time = Time.now

thread2 = Thread.new { sleep 5;  thread1.kill }

thread1.join

puts "Correct answers are :  #{correct_answers}"
puts "Total given answers are :  #{answers_given}"

city = "Itoshima"
>> prefecture = "Fukuoka"
>> puts "#{city} #{prefecture}"
Itoshima Fukuoka
=> nil
>> puts "#{city}^V<Tab>#{prefecture}"
Itoshima^V<Tab>Fukuoka
=> nil
>> puts "#{city}\^V<Tab>#{prefecture}"
Itoshima^V<Tab>Fukuoka
=> nil
>> puts "#{city} \t #{prefecture}"
Itoshima 	 Fukuoka
=> nil
>> puts '#{city} \t #{prefecture}'
#{city} \t #{prefecture}
=> nil
>> rececar.length
Traceback (most recent call last):
        1: from (irb):9
NameError (undefined local variable or method `rececar' for main:Object)
>> "rececar".length
=> 7
>> "racecar".reverse
=> "racecar"
>> s = "racecar"
>> s == s.reverse
=> true
>> puts "It's a palindrome!" if s == s.reverse
It's a palindrome!
=> nil
>> s = "onomatopoeia" 
>> puts "It's a palindrome!" if s == s.reverse
=> nil
?> def string_message(str = '')
?>   if str.empty?
?>     "It's an empty string!"
?>   else
?>     "The string is nonempty."
?>   end
>> end
=> :string_message
>> puts string_message("foobar")
The string is nonempty.
=> nil
>> puts string_message("")
It's an empty string!
=> nil
>> puts string_message
It's an empty string!
=> nil
>> #引数を省略すると、デフォルト値を返す
=> nil
?> def palindrome_tester(s)   if FILL_IN
?>     >>     puts "It's a palindrome!"
>>   >>   else
?>     >>     puts "It's not a palindrome."
>>     >>   end
>>     >> end
Traceback (most recent call last):
SyntaxError ((irb):29: syntax error, unexpected >>)
    >>     puts "It's a palindrome!"
    ^~
(irb):30: syntax error, unexpected >>, expecting `end'
  >>   else
  ^~
(irb):32: syntax error, unexpected >>, expecting `end'
    >>   end
    ^~
?> def palindrome_tester(s)
?>   if s == s.reverse
?>     puts "It's a palindrome!"
?>   else
?>     puts "It's not a palindrome."
?>   end
>> end
=> :palindrome_tester
>> puts palindrome_tester("racecar")
It's a palindrome!

=> nil
>> puts palindrome_tester("racecar")“onomatopoeia”
Traceback (most recent call last):
SyntaxError ((irb):42: syntax error, unexpected local variable or method, expecting end-of-input)
...er("racecar")“onomatopoeia”
...             ^~~~~~~~~~~~~~~~~~
>> puts palindrome_tester("onomatopoeia")
It's not a palindrome.

=> nil
>> palindrome_tester("racecar").nil?
It's a palindrome!
=> true

>> "foo bar　bas".split
=> ["foo", "bar　bas"]
>> "foo bar  baz".split
=> ["foo", "bar", "baz"]
>> "fooxbarxbaz".split('x')
=> ["foo", "bar", "baz"]
>> a = [10,20,30]
>> a[0]
=> 10
>> a[1]
=> 20
>> a[2]
=> 30
>> a[3]
=> nil
>> a
=> [10, 20, 30]
>> a.first
=> 10
>> a.last
=> 30
>> a[-1]
=> 30
>> a[-2]
=> 20
>> a[-3]
=> 10
>> a[-4]
=> nil
>> a.length
=> 3
>> a.empty
Traceback (most recent call last):
        1: from (irb):17
NoMethodError (undefined method `empty' for [10, 20, 30]:Array)
Did you mean?  empty?
>> a.empty?
=> false
>> !a.empty?
=> true
>> a.sort
=> [10, 20, 30]
>> a
=> [10, 20, 30]
>> a.reverse
=> [30, 20, 10]
>> a.sort
=> [10, 20, 30]
>> a.shuffle
=> [10, 20, 30]
>> a.shuffle
=> [30, 10, 20]
>> a.reverse!
=> [30, 20, 10]
>> a
=> [30, 20, 10]
>> a.push(6)
=> [30, 20, 10, 6]
>> a<<7
=> [30, 20, 10, 6, 7]
>> a<<"foo"<<"bar"
=> [30, 20, 10, 6, 7, "foo", "bar"]
>> a
=> [30, 20, 10, 6, 7, "foo", "bar"]
>> a.join
=> "30201067foobar"
>> a.join(', ')
=> "30, 20, 10, 6, 7, foo, bar"
>> 0..9
=> 0..9
>> 0..9.to_a
Traceback (most recent call last):
        1: from (irb):35
NoMethodError (undefined method `to_a' for 9:Integer)
Did you mean?  to_s
               to_c
               to_d
               to_r
               to_f
               to_i
>> (0..9).to_a
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>> a= %w[foo bar baz quux]
>> a
=> ["foo", "bar", "baz", "quux"]
>> a[0..2]
=> ["foo", "bar", "baz"]
>> a = (0..9).to_a
>> a
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>> a[2..(a.length - 1)]
=> [2, 3, 4, 5, 6, 7, 8, 9]
>> a[2..-1]
=> [2, 3, 4, 5, 6, 7, 8, 9]
>> ('a'..'e').to_a
=> ["a", "b", "c", "d", "e"]
>> a = %w[A man, a plan, a canal, Panama]
>> a
=> ["A", "man,", "a", "plan,", "a", "canal,", "Panama"]
>> a = "A man, a plan, a canal, Panama".split
>> a
=> ["A", "man,", "a", "plan,", "a", "canal,", "Panama"]
>> a = "A man, a plan, a canal, Panama".split(', ')
>> a
=> ["A man", "a plan", "a canal", "Panama"]
>> s = a.join
>> s
=> "A mana plana canalPanama"
>> s = s.split(' ').join
>> s
=> "AmanaplanacanalPanama"
>> palindrome_tester("ama")
Traceback (most recent call last):
        1: from (irb):55
NoMethodError (undefined method `palindrome_tester' for main:Object)
?> def palindrome_tester(s)
?>   ?>   if s == s.reverse
?>   ?>     puts "It's a palindrome!"
?> ?>   else
?>   ?>     puts "It's not a palindrome."
>>   ?>   end
Traceback (most recent call last):
SyntaxError ((irb):58: syntax error, unexpected local variable or method, expecting `end')
  ?>     puts "It's a palindrome!"
         ^~~~
(irb):59: else without rescue is useless
?>   else
     ^~~~
(irb):60: syntax error, unexpected local variable or method, expecting `end'
  ?>     puts "It's not a palindrome."
         ^~~~
>> >> end
Traceback (most recent call last):
SyntaxError ((irb):62: syntax error, unexpected >>)
>> end
^~
?> def palindrome_tester(s)
?>   if s == s.reverse
?>     puts "It's a palindrome!"
?>   else
?>     puts "It's not a palindrome."
?>   end
>> end
=> :palindrome_tester
>> puts palindrome_tester(s)
It's not a palindrome.

=> nil
>> puts palindrome_tester(s.downcase)
It's a palindrome!

=> nil
>> s.downcase
=> "amanaplanacanalpanama"
>> ('a'..'z').to_a
=> ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
>> az  = ('a'..'z').to_a
>> a[7]
=> nil
>> az[7]
=> "h"
>> az[-7]
=> "t"
>> (1..5).each { |i| puts 2 * i }
2
4
6
8
10
=> 1..5
?> (1..5).each do |i|
?>   puts 2*i
>> end
2
4
6
8
10
=> 1..5
?> (1..5).each do |number|
?>   puts 2 * number
?>   puts '__'
>> end
2
__
4
__
6
__
8
__
10
__
=> 1..5
>> 3.times { puts "Betelgeuse!" } 
Betelgeuse!
Betelgeuse!
Betelgeuse!
=> 3
>>  (1..5).map { |i| i**2 }          # 「**」記法は冪乗 (べき乗)
=> [1, 4, 9, 16, 25]
>> (1..5)
=> 1..5
>> a = (1..5)
>> a
=> 1..5
>> %w[a b c]                        # %w で文字列の配列を作成
=> ["a", "b", "c"]
>> %w[a b c].map { |char| char.upcase }
=> ["A", "B", "C"]
>> %w[A B C].map { |char| char.downcase }
=> ["a", "b", "c"]
>> %w[A B C].map(&:downcase)
=> ["a", "b", "c"]
>> (0..16).each{|i| puts i ** 2}
0
1
4
9
16
25
36
49
64
81
100
121
144
169
196
225
256
=> 0..16
?> def yeller(s)
?>   s.join.upcase
>> end
=> :yeller
>> yeller(['o', 'l', 'd'])
=> "OLD"
?> def yeller(s)
?>   s.map[&:upcace].join
>> end
=> :yeller
>> yeller(['o', 'l', 'd'])
Traceback (most recent call last):
        2: from (irb):103
        1: from (irb):101:in `yeller'
NoMethodError (undefined method `[]' for #<Enumerator: ["o", "l", "d"]:map>)
?> def yeller(s)
?>   s.map(&:upcace).join
>> end
=> :yeller
>> yeller(['o', 'l', 'd'])
Traceback (most recent call last):
        3: from (irb):107
        2: from (irb):105:in `yeller'
        1: from (irb):105:in `map'
NoMethodError (undefined method `upcace' for "o":String)
Did you mean?  upcase
               upcase!
?> def yeller(s)
?>   s.map(&:upcase).join
>> end
=> :yeller
>> yeller(['o', 'l', 'd'])
=> "OLD"
?> def random_subdomain
?>   
Traceback (most recent call last):
SyntaxError ((irb):113: syntax error, unexpected end-of-input)
?> def random_subdomain
?>   (a..z).to_a.shuffle[0..7].join
>> end
=> :random_subdomain
>> random_subdomain
Traceback (most recent call last):
        2: from (irb):117
        1: from (irb):115:in `random_subdomain'
NameError (undefined local variable or method `a' for main:Object)
?> def random_subdomain
?>   ('a'..'z').to_a.shuffle[0..7].join
>> end
=> :random_subdomain
>> random_subdomain
=> "hmbjgqrv"
?> def string_shuffle(s)
?>   s.split('').shuffle.join
>> end
=> :string_shuffle
>> string_shuffle(yasushiteruya)
Traceback (most recent call last):
        1: from (irb):125
NameError (undefined local variable or method `yasushiteruya' for main:Object)
>> string_shuffle("yasushiteruya")
=> "aaestuyiyhsru"
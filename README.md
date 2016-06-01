# crackin
Algorithm practice with *Cracking the Coding Interview*

## Setup
```
$ gem install bundler
$ bundle install
```

## Run Tests
```
$ bundle exec rake
```

## Run Linter
```
$ bundle exec rubocop
```

## Open Console
```
$ bin/console
[1] pry(main)> Structure::LinkedList.new.push(:last).push(:first)
=> #<Structure::LinkedList:0x007f9c7c9840e8
 @head=#<struct Structure::LinkedList::Node data=:first, next=#<struct Structure::LinkedList::Node data=:last, next=nil>>>
[2] pry(main)> exit
```

## Run Benchmark Scripts
```
$ ruby script/benchmarks/flow_zeroes.rb 1000
       user     system      total        real
1  0.140000   0.000000   0.140000 (  0.140366)
2  0.230000   0.000000   0.230000 (  0.240081)
3  0.240000   0.000000   0.240000 (  0.253048)

$ ruby script/benchmarks/remove_duplicates.rb
       user     system      total        real
   0.000000   0.000000   0.000000 (  0.000003)
   0.000000   0.000000   0.000000 (  0.000014)
```

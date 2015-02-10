Romanize
========

We're gonna write a pair of programs that convert [Roman numerals][roman] to their Arabic counterparts and vice versa.

    > ./deromanize I
    1
    > ./deromanize II
    2
    > ./deromanize MCMIV
    1904

    > ./romanize 1
    I
    > ./romanize 2
    II
    > ./romanize 1904
    MCMIV

My advice is to start with the `deromanize` part. To start:

1. Create a directory based on the name of your implementation language (e.g. `languages/C`)
2. Create a simple `Rakefile` that has, at a minimum, a `build` task within your language's namespace (e.g. `C:build`).  You should check the environment and fail fast if dependencies aren't met.
3. Create your implementation and run `rake` from the project root.

### Example Rakefile

```ruby
namespace :C do
  task :check do
    `which cc`
    raise "Please ensure that you have a valid C compiler" unless $?.success?
  end

  task :build => :check do
    path = File.dirname(__FILE__)
    `cd #{path}; make romanize`
  end
end
```

[roman]: http://en.wikipedia.org/wiki/Roman_numerals

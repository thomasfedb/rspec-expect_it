[![Gem Version](https://img.shields.io/gem/v/rspec-expect_it.svg?style=flat-square)](http://rubygems.org/gems/rspec-expect_it)
[![Build Status](https://img.shields.io/travis/thomasfedb/rspec-expect_it.svg?style=flat-square)](https://travis-ci.org/thomasfedb/rspec-expect_it)
[![Code Climate](https://img.shields.io/codeclimate/github/thomasfedb/rspec-expect_it.svg?style=flat-square)](https://codeclimate.com/github/thomasfedb/rspec-expect_it)

# RSpec::ExpectIt

Makes writing nice RSpec tests a little easier by providing a `expect_it` helper
and a few helpful variations.

Compatible with:
 - Ruby 1.9.3 and greater
 - RSpec 3.0.0 and greater

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rspec-expect_it"
```

And then execute:

```sh
$ bundle
```

## Usage

### expect_it
The main feature is the `expect_it` helper, which is equivalent to `expect(subject)` with lazy evaluation.

```ruby
subject { "MyString" }

specify { expect_it.to eq "MyString" }
```

When you use `expect_it` the `subject` will be evaluated lazily. That is, the matcher
will be evaluated before the subject. This can be very helpful, for example:

```ruby
let(:posts) { FactoryGirl.create_list :posts, 3 }

subject { get :index; assigns(:posts) }

specify { expect_it.to eq posts }
```

If you were using `expect(subject)` you would have to use `let!(:posts)`.

### expect_it!

If you want eager evaluation of the subject, use `expect_it!`.

```ruby
subject { @value += 1 }

specify { expect_it!.to eq @value }
```

### expect_it{}

Calling `expect_it{}` is equivalent to `expect{subject}`.

```ruby
subject { @value += 1 }

specify { expect_it{}.to change{@value}.by(1) }
```

### expect_its

Calling `expect_its(:method)` is equivalent to `expect(subject.method)`.

```ruby
subject { "foobar" }

specify { expect_its(:length).to eq 6 }
```

### expect_its!

If you want eager evaluation of the subject and method call, use `expect_its!`.

```ruby
subject { @value += 1 }

specify { expect_its!(:to_s).to eq @value.to_s }
```

### expect_it_safe{}

The `expect_it_safe{}` helper is the same as `expect_it{}`, except that it will
swallow any exceptions raised in the subject (but not in matchers(. This can be
helpful when testing failure scenarios.

```ruby
subject { raise Exception; @value = 12 }

specify { expect_it_safe{}.to_not change{@value} }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add your feature and specs.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

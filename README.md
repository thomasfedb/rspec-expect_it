# RSpec::ExpectIt

[![Build Status](https://travis-ci.org/thomasfedb/rspec-expect_it.png?branch=master)](https://travis-ci.org/thomasfedb/rspec-expect_it) [![Gem Version](https://badge.fury.io/rb/rspec-expect_it.png)](http://badge.fury.io/rb/rspec-expect_it) [![Code Climate](https://codeclimate.com/github/thomasfedb/rspec-expect_it.png)](https://codeclimate.com/github/thomasfedb/rspec-expect_it)

Makes writing nice RSpec tests a little easier by providing expect_it helpers.

Compatible with Ruby 1.9.2 and greater.

## Installation

Add this line to your application's Gemfile:

    gem "rspec-expect_it"

And then execute:

    $ bundle

## Usage

### expect_it
The main feature is the `expect_it` helper, which is equivalent to `expect(subject)`.

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
There is no `_safe` version of this helper.

```ruby
subject { "foobar" }

specify { expect_its(:length).to eq 6 }
```

### expect_its!

If you want eager evaluation of the subject and method call, use `expect_its!`.
There is no `_safe` version of this helper.

```ruby
subject { @value += 1 }

specify { expect_its!(:to_s).to eq @value.to_s }
```

### expect_it_safe

The `expect_it_safe` helper is the same as `expect_it`, except that it will
swallow any exceptions and return `nil`.

```ruby
subject { raise Exception }

specify { expect_it_safe.to eq nil }
```

### expect_it_safe!

The `expect_it_safe!` helper is the same as `expect_it!`, except that it will
swallow any exceptions and return `nil`.

```ruby
subject { raise Exception }

specify { expect_it_safe!.to eq nil }
```

### expect_it_safe{}

The `expect_it_safe{}` helper is the same as `expect_it{}`, except that it will
swallow any exceptions and return `nil`.

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

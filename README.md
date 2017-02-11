# GoogleMobileFriendly

Google Mobile-Friendly Test API wrapper for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_mobile_friendly', :git => 'https://github.com/loadkpi/google_mobile_friendly.git'
```

And then execute:

    $ bundle


## Usage

    page_one = GoogleMobileFriendly::Request.new 'http://yandex.ru', 'YOUR_API_KEY'
    page_one .is_mobile_friendly?
    # => true


    page_two = GoogleMobileFriendly::Request.new 'http://edition.cnn.com/EVENTS/1996/year.in.review/', 'YOUR_API_KEY'
    page_two.is_mobile_friendly?
    # => false
    page_two.list_of_issues
    # => ["Touch elements are too close to each other. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#touch_elements_too_close).", "Viewsport is not specified using the meta viewport tag. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#viewport_not_configured).", "Font size is too small for easy reading on a small screen. [Learn More]\n(https://support.google.com/webmasters/answer/6352293#small_font_size)."]


## License

[MIT](http://opensource.org/licenses/MIT)

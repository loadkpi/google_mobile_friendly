# GoogleMobileFriendly

[![Build Status](https://travis-ci.org/loadkpi/google_mobile_friendly.svg?branch=master)](https://travis-ci.org/loadkpi/google_mobile_friendly) [![Code Climate](https://codeclimate.com/github/loadkpi/google_mobile_friendly/badges/gpa.svg)](https://codeclimate.com/github/loadkpi/google_mobile_friendly)

Ruby Wrapper for Mobile-Friendly Test from Google Search Console URL Testing Tools API

See Google documentation for more information - https://developers.google.com/webmaster-tools/search-console-api/reference/rest/    

## Requirements

* Ruby >= 2.0.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_mobile_friendly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_mobile_friendly


## Usage

    page_one = GoogleMobileFriendly.run_test 'http://google.com', 'YOUR_API_KEY'
    page_one.is_mobile_friendly?
    # => true
    page_one.list_of_mobile_issues
    # => nil
    page_one.list_of_blocked_resources
    # => ["https://www.gstatic.com/og/_/ss/k=og.mob.o3hu3mtmammu.L.W.O/m=md/excm=mih,mab,meb/d=1/ed=1/rs=AA2YrTsgcHY9rgal7Q_4KtT2B4QI4nDAcA", "https://www.gstatic.com/og/_/js/k=og.mob.en_US.09TQbv5ZB3k.O/rt=j/m=md/exm=mih,mab,meb/d=1/ed=1/rs=AA2YrTtYyrscNOyD60o4h8_Tc0H3-gaXUQ", "https://www.google.com/xjs/_/js/k=xjs.qs.en_US.JLMJY8f85DU.O/m=sx,c,sb_mob,bct,cdos,elog,hsm,jsa,mbsf,qim,r,qsm,d,csi/am=gCNop3GCBgwAWHU0S-wLCAEoBA/rt=j/d=1/t=zcms/rs=ACT90oHfJ0gcIaPuA4F8guH-oefRznVKvw"]

    page_two = GoogleMobileFriendly.run_test 'http://edition.cnn.com/EVENTS/1996/year.in.review/', 'YOUR_API_KEY'
    page_two.is_mobile_friendly?
    # => false
    page_two.list_of_mobile_issues
    # => ["Touch elements are too close to each other. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#touch_elements_too_close).", "Viewsport is not specified using the meta viewport tag. [Learn more]\n(https://support.google.com/webmasters/answer/6352293#viewport_not_configured).", "Font size is too small for easy reading on a small screen. [Learn More]\n(https://support.google.com/webmasters/answer/6352293#small_font_size)."]


## License

[MIT](http://opensource.org/licenses/MIT)

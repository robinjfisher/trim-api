= trim_api

http://github.com/robinjfisher/trim-api

== DESCRIPTION:

A simple Ruby library for accessing the tr.im API

== FEATURES/PROBLEMS:

Supports trimming and expanding of URLS.
More features coming soon.

== REQUIREMENTS:

The following gems are required:

- HTTPClient

== INSTALL:

gem sources -a http://gemcutter.org
gem install trim-api

== USAGE:

require 'rubygems'
require 'trim_api'

* Authentication on the initialisation is only required if you intend to use an API call that requires authentication. For example, to trim a url, no authentication is required.

api = TrimApi::Trim.new(:username => "username", :password => "password")
api.trim("http://www.google.com/")

Returns the trimmed url as a string in the format http://tr.im/ABCD

api.trim_destination("CMo5")

Returns the original destination as a string.

api.trim_reference("CMo5")

Returns the reference for the trimmed url if the authenticated user owns the trimmed url.

api.trim_claim("dkajdsakjdamnsdsma")

Claims a url identified by the unique reference obtained by trim_reference and attaches it to the authenticated user's account.

== LICENSE:

(The MIT License)

Copyright (c) 2009 captured sparks

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

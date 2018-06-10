# Fitz JCR Housing Ballot System
[![Maintainability](https://api.codeclimate.com/v1/badges/287d5091c43c69252cc9/maintainability)](https://codeclimate.com/github/CHTJonas/roomballot/maintainability)
[![Build 
Status](https://travis-ci.org/CHTJonas/roomballot.svg?branch=master)](https://travis-ci.org/CHTJonas/roomballot)

This is the code repository for Fitzwilliam College JCR's online Room & Housing Ballot System.
It is very much still a work in progress and we do not have an estimated release date for a production version.

The [initial incarnation](https://github.com/fitzjcr/roomballot-old) of Roomballot was written in raw PHP with no frameworking.
This became unwieldy to maintain and develop so we transitioned to a Rails application.
Roomballot now runs exclusively on Rails, with a few helper scripts written in Python.
It is designed to run on the SRCF's web server, but in theory it should be easily deployed elsewhere too.

## Contributors
Roomballot was written by:
* [Charlie Jonas](https://github.com/chtjonas) - JCR Webmaster 2016
* [Tom Benn](https://github.com/fridgecow) - JCR Webmaster 2017

## Demo
There is a demo version of Roomballot which gets automatically deployed to Heroku.
You can view it [here](https://roomballot-prod.herokuapp.com)

## Installation
Roomballot can be installed on the SRCF or a private VPS. Full installation instructions are available on the project wiki [here](https://github.com/fitzjcr/roomballot/wiki/Install).
The software itself depends on the following application services or frameworks:
* Ruby on Rails
* PostgreSQL (MySQL possible but unsupported)
* Redis

If you need to monitor your production deployment then Roomballot can optionally integrate with the following DevOps tools:
* Sentry

## Contributing
You are cordially invited to contribute to this project!
We welcome comments and new feature suggestions in addition to bug reports in the form of GitHub [issues](https://github.com/fitzjcr/roomballot/issues).
If you think this is something you can do yourself:
1. Fork it ( https://github.com/fitzjcr/roomballot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

If you are reporting a security vulnerability we ask that you not submit a public issue but send an email to the project maintainers.
Please see our [Code of Conduct](https://github.com/fitzjcr/roomballot/blob/master/CODE_OF_CONDUCT.md) and
[Contributing Guidelines](https://github.com/fitzjcr/roomballot/blob/master/CONTRIBUTING.md) for more information.

## License & Legal
The Fitzwilliam College JCR Room Balloting System is released as open source/libre software under Version 3 of the GNU General Public License.
See the LICENSE file for the full details, but to summarise:
* The software is released “as is” without warranty of any kind. The entire risk as to the quality and performance of the software is with you. Should the software prove defective, you assume the cost of all necessary servicing, repair or correction.
* In no event will we be liable to you for damages arising out of the use or inability to use the program (eg. loss of data, data being rendered inaccurate, failure of the program to operate with any other programs et cetera).

Fitzwilliam College Junior Combination Room is a separate organisation and legal entity from both Fitzwilliam College and the University of Cambridge, none of which hold legal copyright over this software.

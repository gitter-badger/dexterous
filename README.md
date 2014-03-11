![Screenshot](http://i.imgur.com/qUwNIyL.png)

# Dexterous

Dexterous is a Web application targeted towards people who are exploring
into specialized fields of study or developing a particular skill set on
their own. It helps to organize their workflow through exploration tracks,
which are simply a sequence of milestones and associated learning resources.

Users are encouraged to share their exploration tracks with others to
facilitate collaborative learning. In this respect exploration tracks are
similar to courses but they are created by users themselves and fine tuned
as per their requirements and time-constraints.

It can be compared to various online learning platforms but the key difference
is that Dexterous is entirely decentralized. There are no distinctions
between educators and students and anyone can create their courses. There are
no degrees to be awarded, no pointless competition among participants and
no centralized syllabus or timeframe.

## Technicalities

Dexterous is a web application powered by [Ruby on Rails framework](http://rubyonrails.org/).

## Current state of progress

Dexterous is very much a work in progress. But the preliminary functionalities
are in place and goals are well defined. We welcome any contributions in form
of code, criticism or suggestions. Please use
[Github issues](https://github.com/lorefnon/dexterous/issues) for reporting bugs
or suggesting ideas.

## Dependencies

### Ruby
MRI Ruby 2.0 is being used for development. I don't plan to test against older
versions. Although I do plan to support JRuby eventually.

### Database
An activerecord supported database has to be installed and configured separately.
Currently the application is being tested only against mysql.

### Testing
Tests use rspec and cucumber. Cucumber scenarios involving javascript are 
configured to use poltergeist, and hence require phantomjs to be installed.

### JS runtime
Some assets precompilers (stylus and coffeescript) rely on a javascript runtime
being present. In case one is not already installed, please install Node.js.

## License

Code is released under [GPL v3.0 license](https://www.gnu.org/copyleft/gpl.html).
Please see the document named LICENSE in the project root. If you would like to
use Dexterous but find its license unsuitable for your purpose, please
feel free to get in touch.

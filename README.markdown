# Serendipity - a PHP Weblog/Blog software

[Serendipity](http://s9y.org) is a PHP-powered weblog application which gives the user an easy way to maintain an online diary, weblog or even a complete homepage. While the default package is designed for the casual blogger, Serendipity offers a flexible, expandable and easy-to-use framework with the power for professional applications.

This is a testing branch to mainly support the new backend smartification.

Use with care!

https://github.com/ophian/s9y-admin-tpl forked from https://github.com/yellowled/s9y-admin-tpl

## Installation

### Installation with composer

You can install Serendipity with composer. First download composer from www.getcomposer.org. Then you can install Serendipity:

    composer.phar create-project --repository-url="http://composer.fadoe.de" serendipity/serendipity ./serendipity dev-2.0-composer

### Installation with git

You can also install Serendipity by cloning from github.

    git clone https://github.com/fadoe/Serendipity.git ./serendipity -b 2.0-composer

Now you can install the vendor libraries with composer:

    cd serendipity
    composer.phar install

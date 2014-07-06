#!perl -T
use v5.10;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Template::Plugin::Ordinate' ) || print "Bail out!\n";
}

diag( "Testing Template::Plugin::Ordinate $Template::Plugin::Ordinate::VERSION, Perl $], $^X" );

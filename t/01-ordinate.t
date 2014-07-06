#!perl -T

use strict;
use warnings;

use Template::Test;
use Template::Plugin::Ordinate;

my %vars = (
    ord1  =>  '1st',
    ord2  =>  '2nd',
    ord3  =>  '3rd',
    ord4  =>  '4th',
    ord5  =>  '5th',
    ord6  =>  '6th',
    ord10 => '10th',
    ord20 => '20th',
    ord21 => '21st',
    ord52 => '52nd',
);

test_expect(\*DATA, undef, \%vars);

__DATA__
-- test --
-- name ord1 --
[% USE Ordinate -%]
[% ord1 | ordinate %]
-- expect --
1st

-- test --
-- name ord2 --
[% USE Ordinate -%]
[% ord2 | ordinate %]
-- expect --
2nd

-- test --
-- name ord3 --
[% USE Ordinate -%]
[% ord3 | ordinate %]
-- expect --
3rd

-- test --
-- name ord4 --
[% USE Ordinate -%]
[% ord4 | ordinate %]
-- expect --
4th

-- test --
-- name ord5 --
[% USE Ordinate -%]
[% ord5 | ordinate %]
-- expect --
5th

-- test --
-- name ord6 --
[% USE Ordinate -%]
[% ord6 | ordinate %]
-- expect --
6th

-- test --
-- name ord10 --
[% USE Ordinate -%]
[% ord10 | ordinate %]
-- expect --
10th

-- test --
-- name ord20 --
[% USE Ordinate -%]
[% ord20 | ordinate %]
-- expect --
20th

-- test --
-- name ord21 --
[% USE Ordinate -%]
[% ord21 | ordinate %]
-- expect --
21st

-- test --
-- name ord52 --
[% USE Ordinate -%]
[% ord52 | ordinate %]
-- expect --
52nd



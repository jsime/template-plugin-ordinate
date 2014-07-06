package Template::Plugin::Ordinate;

use v5.10;
use strict;
use warnings FATAL => 'all';

use Lingua::EN::Numbers::Ordinate;
use Template::Plugin::Filter;

use base qw( Template::Plugin::Filter );

=head1 NAME

Template::Plugin::Ordinate - Filter for converting cardinal integers into their English Ordinal form.

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.0';


=head1 SYNOPSIS

This module provides a Template::Toolkit filter plugin for converting Arabic
numerals into their English Ordinal form (e.g. "1" becomes "1st" and "25"
becomes "25th" and so on). The actual conversion is performed by
Linga::EN::Numbers::Ordinate.

Using the filter is straightforward:

    [% USE Ordinate %]

    [% FOREACH prize IN prizes %]
        [% prize.place | ordinate %] Place: [% prize.amount %]
    [% END %]

=head1 METHODS

=head2 init

Initialize filter object.

=cut

sub init {
    my ($self) = @_;

    $self->{_DYNAMIC} = 1;
    $self->install_filter('ordinate');

    return $self;
}

=head2 filter

Implement filter.

=cut

sub filter {
    my ($self, $text) = @_;

    return $text unless $text =~ m{^\d+$}o;
    return ordinate($text);
}

=head1 AUTHOR

Jon Sime, C<< <jonsime at gmail.com> >>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Template::Plugin::Ordinate


You can also look for information at:

=over 4

=item * GitHub Repository

L<https://github.com/jsime/template-plugin-ordinate>

=back


=head1 ACKNOWLEDGEMENTS

This plugin is a pretty thin wrapper around C<Linga::EN::Numbers::Ordinate>
which does all the real work of converting numerals.

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Jon Sime.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1;

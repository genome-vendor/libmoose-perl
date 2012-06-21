package Moose::Meta::Method::Accessor::Native::Array::uniq;

use strict;
use warnings;

use List::MoreUtils ();

our $VERSION = '1.17';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader' =>
    { -excludes => ['_maximum_arguments'] };

sub _maximum_arguments { 0 }

sub _return_value {
    my $self        = shift;
    my $slot_access = shift;

    return "List::MoreUtils::uniq \@{ ($slot_access) }";
}

no Moose::Role;

1;

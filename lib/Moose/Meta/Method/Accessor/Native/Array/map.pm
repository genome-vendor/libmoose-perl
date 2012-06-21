package Moose::Meta::Method::Accessor::Native::Array::map;

use strict;
use warnings;

use Params::Util ();

our $VERSION = '1.17';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader' => {
    -excludes => [
        qw(
            _minimum_arguments
            _maximum_arguments
            _inline_check_arguments
            )
    ]
};

sub _minimum_arguments { 1 }

sub _maximum_arguments { 1 }

sub _inline_check_arguments {
    my $self = shift;

    return $self->_inline_throw_error(
        q{'The argument passed to map must be a code reference'})
        . q{ unless Params::Util::_CODELIKE( $_[0] );};
}

sub _return_value {
    my $self        = shift;
    my $slot_access = shift;

    return "map { \$_[0]->() } \@{ ($slot_access) }";
}

no Moose::Role;

1;

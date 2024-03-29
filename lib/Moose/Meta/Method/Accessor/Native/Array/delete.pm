package Moose::Meta::Method::Accessor::Native::Array::delete;

use strict;
use warnings;

our $VERSION = '1.17';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Array::Writer' => {
    -excludes => [
        qw(
            _minimum_arguments
            _maximum_arguments
            _inline_check_arguments
            _inline_optimized_set_new_value
            _return_value
            )
    ],
};

sub _minimum_arguments { 1 }

sub _maximum_arguments { 1 }

sub _inline_check_arguments {
    my $self = shift;

    return $self->_inline_check_var_is_valid_index('$_[0]');
}

sub _adds_members { 0 }

sub _potential_value {
    my ( $self, $slot_access ) = @_;

    return
        "( do { my \@potential = \@{ ($slot_access) }; \@return = splice \@potential, \$_[0], 1; \\\@potential } )";
}

sub _inline_optimized_set_new_value {
    my ( $self, $inv, $new, $slot_access ) = @_;

    return "\@return = splice \@{ ($slot_access) }, \$_[0], 1";
}

sub _return_value {
    my ( $self, $slot_access ) = @_;

    return 'return $return[0];';
}

no Moose::Role;

1;

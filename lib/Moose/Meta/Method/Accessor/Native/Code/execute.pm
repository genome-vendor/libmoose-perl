package Moose::Meta::Method::Accessor::Native::Code::execute;

use strict;
use warnings;

our $VERSION = '1.17';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Reader';

sub _return_value {
    my ( $self, $slot_access ) = @_;

    return "${slot_access}->(\@_)";
}

no Moose::Role;

1;

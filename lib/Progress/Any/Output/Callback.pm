package Progress::Any::Output::Callback;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

sub new {
    my ($class, %args) = @_;

    $args{callback} or die "Please specify 'callback'";

    bless \%args, $class;
}

sub update {
    $_[0]->{callback}->call(@_);
}

1;
# ABSTRACT: Propagate progress update to a callback function

__END__

=pod

=head1 NAME

Progress::Any::Output::Callback - Propagate progress update to a callback function

=head1 VERSION

version 0.02

=head1 SYNOPSIS

 use Progress::Any::Output;
 Progress::Any::Output->set('Callback', callback=>sub { ... });

=head1 DESCRIPTION

This output propagates progress update to your specified callback. Callback will
receive what the output's update() receives: C<< $self, %args >> where C<%args>
contains: C<indicator>, C<message>, C<level>, etc.

=for Pod::Coverage ^(update)$

=head1 METHODS

=head2 new(%args) => OBJ

Instantiate. Usually called through C<<
Progress::Any::Output->set("Callback", %args) >>.

Known arguments:

=over

=item * callback => CODE

Required.

=back

=head1 SEE ALSO

L<Progress::Any>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

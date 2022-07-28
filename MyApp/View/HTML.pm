package MyApp::Demo::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

MyApp::Demo::View::HTML - TT View for MyApp::Demo

=head1 DESCRIPTION

TT View for MyApp::Demo.

=head1 SEE ALSO

L<MyApp::Demo>

=head1 AUTHOR

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

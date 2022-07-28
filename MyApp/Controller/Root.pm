package MyApp::Demo::Controller::Root;
use Moose;
use namespace::autoclean;
use MyApp::Demo::Validation::Form;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

MyApp::Demo::Controller::Root - Root Controller for MyApp::Demo

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    if($c->req->method eq 'POST') {
        my $params =  $c->req->body_params;
        my $account_number = $params->{account_number};
        my $form;
        eval {
            $form = MyApp::Demo::Validation::Form->new(account_number => $account_number);
        };
        if($@) {  
            $c->stash->{message} = "Form Error !";
        }else {
            $c->log->debug($form->account_number);
            my $data = {
                account_number => $form->account_number
            };
            $c->model('DB::UserData')->create($data);
            $c->stash->{message} = 'Posted Successfully';
        }

    }
    $c->stash->{template} = 'index.tt';

}


=head2 view

The View page (/view)

=cut

sub view :Local :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body("Need to work on view ");

}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR


=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

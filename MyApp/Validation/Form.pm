package MyApp::Demo::Validation::Form;

use Moose;


has 'account_number' => (
    is => 'ro',
    isa => 'Int',
    required => 1,
    trigger => sub {
        my ($self,$account_number) = @_;
        unless ($account_number =~/^\d{1,10}$/){
            die "Invalid Account Number!";
        }
    }
);


1;
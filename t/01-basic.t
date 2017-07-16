#!perl
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 3;

use Net::DNS::Resolver::Programmable;


diag(
    "Testing Net::DNS::Resolver::Programmable "
    . $Net::DNS::Resolver::Programmable::VERSION .", Perl $], $^X"
);



# Set up resolver with a fake record
my $resolver = Net::DNS::Resolver::Programmable->new(
    records         => {
        'example.com'     => [
            Net::DNS::RR->new('example.com. 86400  A  127.0.0.5'),
        ],
    },
);

# Check that we get that fake record
my $reply = $resolver->query( 'example.com');

is(ref($reply), "Net::DNS::Packet", "Got a Net::DNS::Packet back");

my ($rr) = $reply->answer;

is($rr->type, "A", "Got a Net::DNS::RR::A object");
is($rr->address, "127.0.0.5", "Correct answer as mocked");


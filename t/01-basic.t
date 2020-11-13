use v6.*;
use Test;

BEGIN my @subs = <foo bar baz>;
BEGIN plan 3 * @subs;;

use subs @subs;

BEGIN ok ::{ '&' ~ $_ }:exists, "did we get an export for $_ at BEGIN" for @subs;

BEGIN dies-ok { foo }, 'did the executing stub foo die';
BEGIN dies-ok { bar }, 'did the executing stub bar die';
BEGIN dies-ok { baz }, 'did the executing stub baz die';

sub foo() { "foo" }
sub bar() { "bar" }
sub baz() { "baz" }

is foo, "foo", 'did we get the right foo';
is bar, "bar", 'did we get the right bar';
is baz, "baz", 'did we get the right baz';

# vim: expandtab shiftwidth=4

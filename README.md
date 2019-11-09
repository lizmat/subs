NAME
====

subs - Port of Perl's pragma to predeclare sub names to Raku

SYNOPSIS
========

    use subs <frob>;
    frob 3..10;

DESCRIPTION
===========

This will predeclare all the subroutine whose names are in the list, allowing you to use them without parentheses even before they're declared.

Unlike pragmas that affect the $^H hints variable, the "use vars" and "use subs" declarations are not BLOCK-scoped. They are thus effective for the entire package in which they appear. You may not rescind such declarations with "no vars" or "no subs".

See "Pragmatic Modules" in perlmodlib and "strict subs" in strict.

PORTING CAVEATS
===============

Due to the nature of the export mechanism in Raku, it is impossible (at the moment of this writing: 2019.11) to export to the OUR:: stash from a module. Therefore the Raku version of this module exports to the **lexical** scope in which the `use` command occurs. For most standars uses, this is equivalent to the Perl behaviour.

If you really want to create stubs in the `OUR::` stash, you can run the following code in your program:

    BEGIN OUR::{$_} := sub { ... } for <&foo &bar &baz>;

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/subs . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018-2019 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.


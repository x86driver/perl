#!/usr/bin/perl -w

use strict;

use constant DEFAULT_PATH => "/home/LinDoremi/scorpio-devel/out/target/product/scorpio/system/lib/";

sub check_file
{
    my $file;
    my ($f) = @_;

    if ($ENV{'OUT'}) {
        $file = "$ENV{'OUT'}/system/lib/$f";
    } else {
        $file = DEFAULT_PATH."$f";
    }

    if (-e $file) {
        print "Check $file OK!\n";
    } else {
        print "Check \033[1;31m$file\033[0;38m not exist!\n";
    }
}

BEGIN
{
    if ($ENV{'OUT'}) {
        print "Use $ENV{'OUT'} for search library\n";
    } else {
        print "No \$OUT, use default path: ", DEFAULT_PATH, "\n";
    }

    print "\n\n";

    while (my $line = <STDIN>) {
        if ($line =~ /\[(.*)\]/) {
            check_file($1);
        }
    }

    
}

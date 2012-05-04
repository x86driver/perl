#!/usr/bin/perl

use strict;

BEGIN
{
    open F, ">edid.bin";
    while (chomp(my $line = <STDIN>)) {
	my @t = split(/ /, $line);
	foreach my $i (@t) {
	    print F pack("C", hex($i));
	}
    }
    close F;
}

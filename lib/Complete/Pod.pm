package Complete::Pod;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Common qw(:all);
use Complete::Module ();
use List::Util qw(uniq);

our %SPEC;
require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(complete_pod);

$SPEC{complete_pod} = {
    v => 1.1,
    summary => 'Complete with installed Perl .pod names',
    description => <<'_',

This is basically <pm:Complete::Module>'s `complete_module` but with
`find_pm`=0, `find_pmc`=0, and `find_pod`=1.

_
    args => {
        %arg_word,
        path_sep    => $Complete::Module::SPEC{complete_module}{args}{path_sep},
        find_prefix => $Complete::Module::SPEC{complete_module}{args}{find_prefix},
        ns_prefix   => $Complete::Module::SPEC{complete_module}{args}{ns_prefix},
    },
    result_naked => 1,
};
sub complete_pod {
    my %args = @_;

    my $word = $args{word} // '';
    Complete::Module::complete_module(
        word => $word,
        find_pm => 0,
        find_pmc => 0,
        find_pod => 1,
        %args);
}

1;
#ABSTRACT:

=head1 SYNOPSIS

 use Complete::Pod qw(complete_pod);
 my $res = complete_pod(word => 'Text::A');
 # -> ['CGI', 'CORE', 'Config', 'perllocal', 'perlsecret']


=head1 ENVIRONMENT


=head1 SEE ALSO

L<Complete::Module>

=cut

use Module::Build;

my $build = Module::Build->new(
    module_name     => 'Net::DNS::Resolver::Programmable',
    dist_author     => 'David Precious <davidp@preshweb.co.uk>',
    license         => 'perl',
    requires        => {
        # Core requirements:
        perl            => 0,
        version         => 0,
        Net::DNS        => 0
    },
    recommends      => {
    },
    build_requires  => {
        # Build-only requirements:
        Module::Build   => '0.2805'
    },
    create_makefile_pl
                    => 'passthrough',
);

$build->create_build_script();



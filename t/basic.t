use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use SPVM 'TestCase::File::Find';

use SPVM 'Fn';
use SPVM::File::Find;
use SPVM 'File::Find';

my $api = SPVM::api();

my $start_memory_blocks_count = $api->get_memory_blocks_count();

ok(SPVM::TestCase::File::Find->prepare_symbolic_links);

ok(SPVM::TestCase::File::Find->find);

# Version
{
  is($SPVM::File::Find::VERSION, SPVM::Fn->get_version_string('File::Find'));
}

SPVM::Fn->destroy_runtime_permanent_vars;

my $end_memory_blocks_count = $api->get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;

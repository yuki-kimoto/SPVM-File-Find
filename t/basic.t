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

ok(SPVM::TestCase::File::Find->test);

# Version
{
  is($SPVM::File::Find::VERSION, SPVM::Fn->get_version_string('File::Find'));
}

done_testing;

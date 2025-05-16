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
use SPVM 'Sys::OS';

my $api = SPVM::api();

my $start_memory_blocks_count = $api->get_memory_blocks_count();

ok(SPVM::TestCase::File::Find->find);

my $symlink_permitted;
if (SPVM::Sys::OS->is_windows) {
  require Win32;
  
  Win32::FsType() eq 'NTFS'
      or skip_all("need NTFS");
  eval { SPVM::Sys->symlink('', '') };
  if ($@ && $@ !~ /not permitted/) {
    $symlink_permitted = 1;
  }
}
else {
  $symlink_permitted = 1;
}

if ($symlink_permitted) {
  ok(SPVM::TestCase::File::Find->prepare_symbolic_links);
  
  ok(SPVM::TestCase::File::Find->find_follow);
}
else {
  warn "[Test Skip]This system is not permitted to create a symboloic link by symlink function.";
}

# Version
{
  is($SPVM::File::Find::VERSION, SPVM::Fn->get_version_string('File::Find'));
}

SPVM::Fn->destroy_runtime_permanent_vars;

my $end_memory_blocks_count = $api->get_memory_blocks_count();
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;

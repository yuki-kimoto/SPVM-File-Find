package SPVM::File::Find;

our $VERSION = "0.025";

1;

=head1 Name

SPVM::File::Find - Finding Files in Subdirectories

=head1 Description

File::Find class in L<SPVM> has methods to find files in subdirectories.

=head1 Usage

  use File::Find;
  
  my $dir = "lib";
  
  File::Find->new({no_chdir => 1})->find(method : void ($info : File::Find::Info) {
    
    my $dir = $info->dir;
    
    my $file_name = $info->name;
    
  }, $top_dir);

Gets file names:

  use File::Find;
  use StringList;
  
  my $dir = "lib";
  
  my $files_list = StringList->new;
  
  File::Find->new({no_chdir => 1})->find([$files_list : StringList] method : void ($info : File::Find::Info) {
    my $file_name = $info->name;
    
    $files_list->push($file_name);
  }, $top_dir);
  
  my $files = $files_list->to_array;

=head1 Fields

=head1 Class Methods

=head2 new

C<static method new : File::Find ($options : object[] = undef);>

Creates a new File::Find object and returns it.

=head1 Instance Methods

C<method find : void ($cb : File::Find::Callback, $dir : string);>

Iterates each file recursively under the $dir and calls the callback $cb by the file.

=head1 Porting

C<SPVM::File::Find> is a Perl's L<File::Find> porting to L<SPVM>.

=head1 Repository

L<SPVM::File::Find - Github|https://github.com/yuki-kimoto/SPVM-File-Find>

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License


package SPVM::File::Find;

our $VERSION = "0.030";

1;

=head1 Name

SPVM::File::Find - Find Files in Subdirectories

=head1 Description

File::Find class in L<SPVM> has methods to find files in subdirectories.

B<Warnings:>

Many tests are not written yet. This class has many bugs.

=head1 Usage

  use File::Find;
  
  my $top_dir = "lib";
  
  File::Find->new->find(method : void ($info : File::Find::Info) {
    
    my $file_name = $info->name;
    
  }, $top_dir);

Gets file names:

  use File::Find;
  use StringList;
  
  my $top_dir = "lib";
  
  my $files_list = StringList->new;
  
  File::Find->new->find([$files_list : StringList] method : void ($info : File::Find::Info) {
    my $file_name = $info->name;
    
    $files_list->push($file_name);
  }, $top_dir);
  
  my $files = $files_list->to_array;

=head1 Fields

=head2 follow

C<has follow : ro byte;>

Causes symbolic links to be followed.

See L<File::Find/"follow"> option for details.

=head2 warn

C<has warn : ro byte;>

If the value of this field is a true value and a system call such as C<stat>, C<lstat>, C<opendir> fails or infinite loops are detected, prints a warning message to stderr.

=head1 Class Methods

=head2 new

C<static method new : L<File::Find|SPVM::File::Find> ($options : object[] = undef);>

Creates a new File::Find object given the options $options, and returns the new object.

Options:

=over 2

=item * follow

C<follow : Int = 0>

Set L</"follow"> field to this value.

=item * warn

C<warn : Int = 0>

Set L</"warn"> field to this value.

=back

=head1 Instance Methods

=head2 find

C<method find : void ($cb : L<File::Find::Callback|SPVM::File::Find::Callback>, $dir : string);>

Iterates each file recursively under the $dir and calls the callback $cb by the file.

Note:

If a symbolic link points to a directory that has already been processed, the files within that directory are skipped to prevent infinite loops.

=head1 See Also

=over 2

=item * L<Sys|SPVM::Sys>

=item * L<IO|SPVM::IO>

=item * L<File::Basename|SPVM::File::Basename>

=item * L<File::Copy|SPVM::File::Copy>

=item * L<File::Spec|SPVM::File::Spec>

=back

=head1 Porting

C<SPVM::File::Find> is a Perl's L<File::Find> porting to L<SPVM>.

=head1 Repository

L<SPVM::File::Find - Github|https://github.com/yuki-kimoto/SPVM-File-Find>

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License


package SPVM::File::Find;

our $VERSION = "0.026";

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
    
    my $dir = $info->dir;
    
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

=head2 bydepth

C<has bydepth : ro byte;>

If this filed is a true value, L</"find"> method reports the name of a directory only AFTER all its entries have been reported.

See L<File::Find/"bydepth"> option for details.

=head2 preprocess

C<has preprocess : ro L<File::Find::Callback::Preprocess|SPVM::File::Find::Callback::Preprocess>;>

This callback is used to preprocess the current directory.

See L<File::Find/"preprocess"> option for details.

=head2 postprocess

C<has postprocess : ro L<File::Find::Callback|SPVM::File::Find::Callback>;>

This callback is invoked just before leaving the currently processed directory. 

See L<File::Find/"postprocess"> option for details.

=head2 follow

C<has follow : ro byte;>

Causes symbolic links to be followed.

See L<File::Find/"follow"> option for details.

=head2 follow_fast

C<has follow_fast : ro byte;>

This is similar to follow except that it may report some files more than once.

See L<File::Find/"follow_fast"> option for details.

=head2 follow_skip

C<has follow_skip : ro byte;>

See L<File::Find/"follow_skip"> option for details.

=head2 dangling_symlinks

C<has dangling_symlinks : ro L<File::Find::Callback::DanglingSymlinks|SPVM::File::Find::Callback::DanglingSymlinks>;>

Specifies what to do with symbolic links whose target doesn't exist.

See L<File::Find/"dangling_symlinks"> option for details.

=head2 no_chdir

C<has no_chdir : ro byte;>

Does not C<chdir()> to each directory as it recurses.

See L<File::Find/"no_chdir"> option for details.

=head2 dont_use_nlink

C<has dont_use_nlink : ro byte;>

See L<File::Find/"$dont_use_nlink"> option for details.

=head2 warn

C<has warn : ro byte;>

If the value of this field is a true value and a system call such as C<chdir> fails, prints a warning message to stderr.

=head1 Class Methods

=head2 new

C<static method new : L<File::Find|SPVM::File::Find> ($options : object[] = undef);>

Creates a new File::Find object given the options $options, and returns the new object.

Options:

=over 2

=item * bydepth

C<bydepth : Int = 0>

See L</"bydepth"> field for details.

=item * preprocess

C<preprocess : L<File::Find::Callback::Preprocess|SPVM::File::Find::Callback::Preprocess> = undef>

See L</"preprocess"> field for details.

=item * postprocess

C<postprocess : L<File::Find::Callback|SPVM::File::Find::Callback> = undef>

See L</"postprocess"> field for details.

=item * follow

C<follow : Int = 0>

Set L</"follow"> field to this value.

=item * follow_fast

C<follow_fast : Int = 0>

Set L</"follow_fast"> field to this value.

=item * follow_skip

C<follow_skip : Int = 0>

If C<follow> or C<follow_fast> option is a true value and this option is not specified, the value is set to 1, otherwise set to 0.

Set L</"follow_skip"> field to this value.

=item * dangling_symlinks

C<dangling_symlinks : L<File::Find::Callback::DanglingSymlinks|SPVM::File::Find::Callback::DanglingSymlinks> = undef>

Set L</"dangling_symlinks"> field to this value.

=item * no_chdir

C<no_chdir : Int = 0>

Set L</"no_chdir"> field to this value.

=item * dont_use_nlink

C<dont_use_nlink : Int = 0>

Set L</"dont_use_nlink"> field to this value.

=item * warn

C<warn : Int = 0>

Set L</"warn"> field to this value.

=back

=head1 Instance Methods

=head2 find

C<method find : void ($cb : L<File::Find::Callback|SPVM::File::Find::Callback>, $dir : string);>

Iterates each file recursively under the $dir and calls the callback $cb by the file.

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


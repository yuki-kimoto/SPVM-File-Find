package SPVM::File::Find::Info;



1;

=head1 Name

SPVM::File::Find::Info - Information about Currently Processed File

=head1 Description

File::Find::Info class in L<SPVM> has methods to get and set information about a currently processed file.

=head1 Usage

  File::Find->new->find(method : void ($info : File::Find::Info) {
    
    my $dir = $info->dir;
    
    my $file_name = $info->name;
    
  }, $top_dir);

=head1 Fields

=head2 dir

C<has dir : ro string;>

The current directory name.

See C<$File::Find::dir> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head2 name

C<has name : ro string;>

The complete pathname to the file.

See C<$File::Find::name> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head2 _

C<has _ : ro string;>

The current filename within that directory.

See C<$_> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head2 fullname

C<has fullname : ro string;>

The absolute pathname of the file with all symbolic links resolved.

See C<$File::Find::fullname> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head2 prune

C<has prune : rw byte;>

If this value is a true value, prunes the tree.

See C<$File::Find::prune> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License


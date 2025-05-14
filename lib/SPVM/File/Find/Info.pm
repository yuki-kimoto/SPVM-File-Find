package SPVM::File::Find::Info;



1;

=head1 Name

SPVM::File::Find::Info - Information about Currently Processed File

=head1 Description

File::Find::Info class in L<SPVM> has methods to get and set information about a currently processed file.

=head1 Usage

  File::Find->new->find(method : void ($info : File::Find::Info) {
    
    my $file_name = $info->name;
    
  }, $top_dir);

=head1 Fields

=head2 name

C<has name : ro string;>

The complete pathname to the file.

See C<$File::Find::name> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head2 prune

C<has prune : rw byte;>

If this value is a true value, prunes the tree.

See C<$File::Find::prune> in L<File::Find wanted function|File::Find/"wanted"> for details.

=head1 See Also

=over 2

=item * L<File::Find|SPVM::File::Find>

=back 

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License


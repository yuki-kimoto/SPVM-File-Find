package SPVM::File::Find::Callback;



1;

=head1 Name

SPVM::File::Find::Callback - Callback for find method

=head1 Description

File::Find::Callback class in L<SPVM> has an interface method for the callback for L<File::Find#find|SPVM::File::Find/"find"> method.

=head1 Usage

  File::Find->new->find(method : void ($info : File::Find::Info) {
    
    my $dir = $info->dir;
    
    my $file_name = $info->name;
    
  }, $top_dir);

=head1 Interface Methods

C<required method : void ($info : L<File::Find::Info|SPVM::File::Find::Info>);>

An interface method for the callback method for L<File::Find#find|SPVM::File::Find/"find"> method.

=head1 See Also

=over 2

=item * L<File::Find|SPVM::File::Find>

=back 

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License


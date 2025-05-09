package SPVM::File::Find::Callback::DanglingSymlinks;



1;

=head1 Name

SPVM::File::Find::Callback::DanglingSymlinks - Callback for dangling_symlinks Option

=head1 Description

File::Find::Callback::DanglingSymlinks interface in L<SPVM> has an interface method for the callback method for C<dangling_symlinks> option.

=head1 Usage

  File::Find->new({
    dangling_symlinks => method : void ($name : string, $dir : string) {
      
    }
  });
  
=head1 Interface Methods

C<required method : void ($name : string, $dir : string);>

An interface method for the callback method for C<dangling_symlinks> option.

=head1 See Also

=over 2

=item * L<File::Find|SPVM::File::Find>

=back 

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License


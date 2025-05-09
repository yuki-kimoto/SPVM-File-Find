package SPVM::File::Find::Callback::Preprocess;



1;

=head1 Name

SPVM::File::Find::Callback::Preprocess - Callback for preprocess Option

=head1 Description

File::Find::Callback::Preprocess interface in L<SPVM> has an interface method for the callback method for C<preprocess> option.

=head1 Usage

  File::Find->new({
    preproces => method : string[] ($files : string[]) {
      
    }
  });
  
=head1 Interface Methods

C<required method : string[] ($files : string[]);>

An interface method for the callback method for C<preprocess> option.

=head1 See Also

=over 2

=item * L<File::Find|SPVM::File::Find>

=back 

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License


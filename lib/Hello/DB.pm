package Hello::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_member {
    my ($self, $record) = @_;
    $self->insert('member', { id => $record->{id}, name => $record->{name} });
}

sub select_member{
    my ($self, $id) = @_;
    my $row = $self->single(
        'member',
        +{ id => $id },
    );
    return $row->{name} if $row;
}

1;

package Hello::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

any '/' => sub {
    my ($c) = @_;
    my $counter = $c->session->get('counter') || 0;
    $counter++;
    $c->session->set('counter' => $counter);
    return $c->render('index.tx', {
        counter => $counter,
    });
};

get '/hello' => sub {
    my ($c) = @_;
    return $c->render( 'index.tx', { counter => 0 } );
};

post '/name_returner' => sub {
    my ($c) = @_;
    my $name = $c->req->param('name');
    return $c->render( 'index.tx', { name => $name } );
};

post '/db_insert' => sub {
    my ($c) = @_;
    my $id = $c->req->param('id');
    my $name = $c->req->param('name');
    $c->db->db_insert(+{ id => $id, name => $name });
    return $c->render( 'index.tx' );
};

post '/db_select' => sub {
    my ($c) = @_;
    my $id = $c->req->param('id');
    my $name = $c->db->db_select($id);
    return $c->render( 'index.tx', { name => $name, is_select_done => 1 } );
};

post '/reset_counter' => sub {
    my $c = shift;
    $c->session->remove('counter');
    return $c->redirect('/');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

1;

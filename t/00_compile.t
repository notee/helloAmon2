use strict;
use warnings;
use Test::More;


use Hello;
use Hello::Web;
use Hello::Web::View;
use Hello::Web::ViewFunctions;

use Hello::DB::Schema;
use Hello::Web::Dispatcher;


pass "All modules can load.";

done_testing;

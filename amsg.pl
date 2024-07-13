use strict;
use Irssi;
use POSIX;

use vars qw($VERSION %IRSSI);

$VERSION = '1.0';
%IRSSI = (
  authors     => 'Antonio Martín Romero',
  contact     => '',
  name        => 'ame',
  description => 'Send a message to all your channels',
  license     => 'GPLv2',
  url         => '',
  changed     => '2024-07-13',
);


sub cmd_ame {
    my($data, $server, $item) = @_;
    if (!$server || !$server->{connected}) {
      Irssi::print("Not connected to server");
      return;
    }

    foreach ( $server->channels() ) {
        $server->command("MSG ".$_->{name}." ".$data);
    }
}

Irssi::command_bind('ame', 'cmd_ame');
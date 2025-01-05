# -*- perl -*-
use strict;
use warnings;
use Test::More tests => 7;

BEGIN { use_ok( 'SMS::Send' ); }
BEGIN { use_ok( 'SMS::Send::Kannel::SMSbox' ); }

{
  my $service = SMS::Send::Kannel::SMSbox->new;
  isa_ok ($service, 'SMS::Send::Kannel::SMSbox');
  isa_ok ($service, 'SMS::Send::Driver');

  my $sms = SMS::Send->new("Kannel::SMSbox");
  isa_ok ($sms, 'SMS::Send');

  my $phone = $ENV{'SMS_TEST_PHONE_NUMBER'};

  SKIP: {
    skip 'Environment SMS_TEST_PHONE_NUMBER not configured', 2 unless $phone;

    {
      my $status=$service->send_sms(
                                    to   => $phone,
                                    text => sprintf('Object: %s, Hello World (%s)', ref($service), time),
                                   );
      ok($status, 'status');
    }

    {
      my $status=$sms->send_sms(
                                to   => $phone,
                                text => sprintf('Object: %s, Hello World (%s)', ref($sms), time),
                               );
      ok($status, 'status');
    }
  }
}

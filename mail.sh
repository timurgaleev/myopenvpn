#!/bin/sh

FROM="your-gmail-address"
AUTH="your-gmail-username"
PASS="your-gmail-password"
FROMNAME="Your VPN"
TO="your-email-address"

if [ -z "$1" ]; then
    echo 'Say something.'
    exit 1
fi

MSG=/tmp/e-mail.txt

echo "From: $FROMNAME <$FROM>" > $MSG
echo -e 'Subject: Message from OpenVPN\n' >> $MSG
echo -e $1 >> $MSG
echo -e '\n---- \nYour friendly VPN' >> $MSG

cat $MSG | sendmail -H 'exec openssl s_client -quiet -tls1_2 -connect smtp.gmail.com:465' \
    -f"$FROM" -au"$AUTH" -ap"$PASS" $TO > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo 'Sent successfully.'
else
    echo 'Error while sending e-mail.'
    exit 1
fi
rm $MSG


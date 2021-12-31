KEY=$1
ssh -i $KEY ubuntu@demo.greeter.xpqf.net << END
sudo sh -c 'echo demo.greeter.xpqf.net > /etc/hostname'
sudo sh -c 'hostname -F /etc/hostname'
uname -a
END
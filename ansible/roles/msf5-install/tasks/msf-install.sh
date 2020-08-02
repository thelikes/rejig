curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall

# create new user
# su to the user
# msfdb stop
# msfdb start
# exit
# cp /home/newuser/.msf4/database.yml ~/.msf4/database.yml
# msfconsole
# db_status

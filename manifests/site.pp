node default {
  file {'/root/README':
    ensure => file,
    content => 'This is first test file',
  }
}
node 'master2.puppet.vm'{
        include role::master_server
        file {'/opt/README':
          ensure => file,
          content => "Welcome to ${fqdn}\n",
            }
}

node /^web/{
  include role::app_server
}

node /^db/{
  include role::db_server
}

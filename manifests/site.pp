node default {
  file {'/root/README':
    ensure => file,
    content => 'This is first test file',
  }
}
node 'master2.puppet.vm'{
        include role::master_server
        }


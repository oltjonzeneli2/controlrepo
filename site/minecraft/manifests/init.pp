class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'http://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar',
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => present,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true, 
    require => [Package['java'],File['/opt/minecraft/eula.txt'],File['/etc/systemd/system/minecraft.service']],
  }
}

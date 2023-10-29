class minecraft {

  $source = 'https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar'
  $install_dir = '/opt/minecraft'

  file {$install_dir:
    ensure => directory,
  }

  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $source,
    before => Service['minecraft'],
  }

  package {'default-jre':
    ensure => present,
  }

  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => "eula=true",
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => 'puppet:///modules/minecraft/minecraft.service',
  }

  service {'minecraft':
    ensure  => running,
    enable => true,
    require => [ Package['default-jre'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service'] ]
  }
}

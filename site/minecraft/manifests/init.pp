class minecraft (
  # the variables we put here are exposed to the outside so we can override them when we use the class
  $url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar'
  $install_dir = '/opt/minecraft'
)
{

  file {$install_dir:
    ensure => directory,
  }

  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
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
    # here the file content is fetched from the templates folder using the epp built-in function in puppet, the templates folder is inside the module folder and it's useful for customizing file values instead of using static files from the files folder
    # so here we are no longer using the file minecraft.service from the files folder
    content => epp('minecraft/minecraft.service.epp', {
      install_dir => $install_dir,
    }),
  }

  service {'minecraft':
    ensure  => running,
    enable => true,
    require => [ Package['default-jre'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service'] ]
  }
}

/*
class minecraft {
  # here the variables are local to the class so we can not overrite them
  $url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar'
  $install_dir = '/opt/minecraft'

  file {$install_dir:
    ensure => directory,
  }

  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
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
    # below the file is fetched from the files folder in the module folder
    source => 'puppet:///modules/minecraft/minecraft.service',
  }

  service {'minecraft':
    ensure  => running,
    enable => true,
    require => [ Package['default-jre'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service'] ]
  }
}
*/

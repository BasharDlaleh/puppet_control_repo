class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQCpgJtCzzZIGduVUi3m9Pa6e/cMOYqZe1GpPcsNKpBk8wqVcwsNxYk4K01g07eMAR5RFWqQmxBPiDJ4jZ6ELDxgrPpLPpzwU3MGtPmd+smogq3hc6wDzNh5zo1binRcR9ylYEIJ2G4at/r/U6J7PwQuIzLfIWZDBAGGrB1Ka2PKtIA5yHUxXCsLr1i7lQQ+exQvdfAnK1feedfAEKPLvIc4YSyKystoJaV5duCx8wLhz7Sd1TaYDTAGZUuaxepdfwDK+1r4bKP1Nj6S8fXE5AIsMZfEKSwAtZH0So3gTn88nnmfhtFOvxVvMwsBPpX7sCoYJbgRUsxGOTL4D9AR3P3y4mxJF0rSt0/XvEGp6pHUbSYDBXo22IbiMayDjfTO8jg8fuDJOGis8m6tI0MhWrmitJ+DG93OSnfg+reFip1gHXpMqwuJCw1MjDryoL80D7+V2XRhADb9MhBOXLXCv/ERj8I+NRpYgMXJWxzGivKD4oEF6jbCMeW7dJ/BHryVbHU=',
	}  
}

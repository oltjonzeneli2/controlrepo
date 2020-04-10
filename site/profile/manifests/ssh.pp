class profile::ssh {
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
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDPMEtsSagw6lLjT1wuKSskv9IHnbAcCb8C+f3xvq61ZM7BQuzd8QKRF2eOd7N4o9B3nklIFDQRXo0imjAfId/K062zaAnGn5/1ZGAMFTpZctkUdEBsT4G/786amiVyIjuVmb0V3s5vJHRCq2vOhyIENtb9PksYfvdzlj45Z+gDNdGqF7r79xZhXJh4TF4LtZX9yDp0bcfLnyvGFg1hvibDitkkhydaPWkOiBklT/5wyrsOsOaUhO3/8p0cnvMGqzsLxHLRaBKjADryCnaXAyFvbNAnEIOraVvQ47t9smnPyoQldmS+nQRxGOql4OwB3yKsl9ytmzIOF/dOqY8z6Wmn',
	} 
}

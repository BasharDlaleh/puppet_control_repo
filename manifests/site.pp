node default{
  file{'/tmp/test.txt':
    ensure => file,
  }
}

# In most programming languages a "class" is an object that can be used in complex ways. Puppet classes are more like functions or methods in other languages, a way of easily calling another set of code.
class profile::base {
  user {'admin':
    ensure => present,
  }
}

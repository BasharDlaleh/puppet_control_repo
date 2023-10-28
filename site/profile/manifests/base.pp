# In most programming languages a "class" is an object that can be used in complex ways. Puppet classes are more like functions or methods in other languages, a way of easily calling another set of code.
# profile are a group of modules/resources that make up one thing like all the necessary resources (user, file, package, service) to create an NGINX web server

class profile::base {
  user {'admin':
    ensure => present,
  }
}

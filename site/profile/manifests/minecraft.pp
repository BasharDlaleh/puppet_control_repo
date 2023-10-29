class profile::minecraft {
  # here we just include the module called minecraft without any custom values
  #include minecraft

  # here we use the minecraft class from the minecraft module and pass custom values for the exposed variables in the class, note that we don't have to pass values for all variables if they have default values
  # calling class here is the same as calling a module since each module should only contain one class in init.pp which name is the same as the module
  # note that a class is a native resource type in puppet
  class {'minecraft':
    install_dir => "/opt/minecraft"
  }
}

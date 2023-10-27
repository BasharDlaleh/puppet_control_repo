node default{

$content = "this is a file generated by puppet\n"
$files_with_paths = [ '/tmp/test1.txt', '/tmp/test2.txt', '/tmp/test3.txt' ]
$files_without_paths = [ 'file1.txt', 'file2.txt', 'file3.txt' ]

  file {$files_with_paths:
    ensure  => file,
    content => $content,
    owner   => 'root',
  }

$files_without_paths.each |String $file| {
  file {"/tmp/${file}":
    ensure  => file,
    content => $content,
    owner   => 'root',
  }
}
/* you can't declare the same resource name more than once in the same file because it will create amibigous configuration so the agent will throw an error
  file {'/tmp/test.txt':
    owner   => 'root',
  }
*/
}
  
  exec {"test":
    command  => "/bin/echo apache2 is installed > /tmp/status.txt",
    # onlyif is an if condition if the command doesn't return anything the condition is false and the above command won't be executed
    onlyif   => "/bin/which apache2",
    # unless is the opposite of onlyif, if the command returns something it's considered false
    #unless   => "/bin/which apache2",
  }

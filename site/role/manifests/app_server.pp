# roles are a group of profiles that define a business role for the machine, like a role that includes NGINX profile and MYSQL profile is a role for a dev server
# always use unique roles for nodes even if 2 nodes has the exact same role, A major point of the roles and profiles pattern is clarity. If you introduce ambiguity in your code, you lose that benefit. 
# Creating multiple roles for similar machines allows you to quickly and easily identify what each machine does.

class role::app_server {
  include profile::base
  include profile::web
  include profile::ssh_server
}

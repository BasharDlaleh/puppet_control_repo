# Note that we specified a version for NGINX module because it's always a good practice just like in docker images
# we should always check what dependencies our module depends on in the forge README file and add those modules too, for example here we found that NGINX module depends on concat and stdlib modules
# Note that we didn't specify a version for the rest of modules which NGINX depends on because that gives us the ability to detect when new versions are available during development and then we specify a version for all when we go live 

mod 'puppet-nginx', '5.0.0'
mod 'puppetlabs-concat'
mod 'puppetlabs-stdlib',

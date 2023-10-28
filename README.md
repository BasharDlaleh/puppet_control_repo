# puppet_control_repo
a contrl repo for puppet configuration


## there are a lot of ways to orchestrate puppet acroos different nodes:
1. MCollective which operates on a publish-subscribe model where a single server, generally your Puppet master, maintains a queue such as ActiveMQ or RabbitMQ. Any other nodes publish and subscribe data to that queue server. This has the advantage of being tolerant of spotty network connections. If a node isn't able to reach the queue, it will still be able to receive any messages published to it once it was able to connect. The major downside is that it's impossible to ensure that a machine has actually received the message

2. using Ansible to ssh to nodes and run the agent periodically, Ansible is not as good as Puppet in managing the desired state of nodes, so many companies use Puppet for manging the disred state of nodes and Ansible for orchestration and procedural imperative tasks. 

3. using SSH alone to do the same as Ansible (works well for small installations)

4. using Puppet Bolt which is designed specifically for puppet ocherstration and integrates well for PuppetDB

## Facter
Facter is the tool that Puppet uses to gather facts about a node, in order to figure out what needs to done on that node. Facter is a standalone tool, so you can use it in other scripts, but it's bundled with Puppet because they're so closely integrated. First, let's try running Facter from the command line.

`#facter   returns all facts about the node`
`#facter fqdn returns only one fact about the node`
`#facter networking.interfaces.eth1.bindings.0.address here we're getting the ip of eth1 note the use of 0 for accessing the items of an array`

## Agent Nodes
in the course the instructor used a puppet module called dockeragent to install docker containers on the master itself to act as agent nodes for a lab instead of creatin separate VMs to act as agent nodes, he created the below profile and included it in the master node role like this:

```class profile::agent_nodes {
  include dockeragent
  dockeragent::node { 'web.puppet.vm': }
  dockeragent::node { 'db.puppet.vm': }
  ###### note that he hardcoded the ip addresses here for the ssh profile instead of adding them in /etc/hosts file of the master
  host {‘web.puppet.vm’:
    ensure => present,
    ip => ‘172.18.0.2’,
  }
  host {‘db.puppet.vm’:
    ensure => present,
    ip => ‘172.18.0.3’,
  }
}

class role::master_server {
  include profile::base
  include profile::agent_nodes
}
```
we can use facts in the puppet config just like variables $fact_name

### How Puppet code works
Puppet language is just a DSL built on top of Ruby programming language, so when a puppet agent runs the facter sends all the agents facts to the master which converts puppet code to Ruby and compiles the Ruby code and generates a catalog (compiled code unreadably by humans )which the agent node executes on itself.

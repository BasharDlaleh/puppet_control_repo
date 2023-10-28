# puppet_control_repo
a contrl repo for puppet configuration

# there are a lot of ways to orchestrate puppet acroos different nodes:
1. using MCOLLECTIVE which uses a publisher/consumer queue like RabbitMQ where puppet master is the publisher and the nodes are consumers
2. using Ansible to ssh to nodes and run the agent periodically
3. using SSH alone to do the same as Ansible
4. using puppet bolt which is designed specifically for puppet ocherstration

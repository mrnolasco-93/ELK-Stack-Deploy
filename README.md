# ELK-Stack-Deploy
Create and deploy ELK Stack with Metricbeat and Filebeat monitoring.
#### Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/Azure_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the "Ansible_YAML_Files" file may be used to install only certain pieces of it, such as Filebeat.

  - Elk_Stack_Deploy

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly efficient, in addition to restricting access to the network.
- Load Balancers ensure that the incoming traffic to a network is not overbearing on a single server. The traffic is distributed evenly, ensuring the continuation of services. From a security standpoint, if for example one server is under attack, operations would not be at a stand-still, the other operating servers may continue to provide service.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitors file logs and log events and forwards the information to an analytics engine such as Elasticsearch or Logstash for indexing.
- Metricbeat takes metrics and statistics that are collected and forwards the information to an analytics engine such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     |       Function      | IP Address | Operating System|
|----------|:-------------------:|:----------:|:---------------:|
| Jump Box |       Gateway       |  10.0.0.4  |       Linux     |
| Web-1    |        Server       |  10.0.0.5  |       Linux     |
| Web-2    |        Sever        |  10.0.0.6  |       Linux     |
| ELK      | Centralized Logging |  10.1.0.4  |       Linux     |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
-  Local Host IP: 67.165.2364

Machines within the network can only be accessed by the Docker Container in the Jump Box machine.
- The ELK VM can only be accessed from the Jump Box VM with a public IP of: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Address |
|----------|:-------------------:|:------------------:|
| Jump Box |          No         |    67.165.236.4    |
| Web-1    |          No         |      10.0.0.4      |
| Web-2    |          No         |      10.0.0.4      |
| ELK      |          No         |      10.0.0.4      |



### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main advantage of using automatic configuration with Ansible is having complete control of the computing infrastructure that is being deployed and making single changes that will configure many environments. Provisioning and management control through the use of Infrastructure as Code (IAC) allows for the deployment and configuration of multiple environments from a single command.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
Create a VM that will be dedicated to the ELK Server
Once the VM has been created, add the machine to Ansible’s ‘hosts’ file.(Seperate from “[webservers]”)
Create a playbook for the ELK installation that includes configuration for modules and commands for: Docker.io, python3-pip, Docker, memory, ELK container, and systemd
Once VM has been created and ELK playbook is created run command “ansible-playbook [NAME_OF_YOUR_PLAYBOOK]”
Once the ELK has been deployed into the VM access to the ELK VM need to be restricted using Azure's network security groups (NSGs)
Whitelisting the administrators IP address allows access over HTTPS
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 
(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6

We have installed the following Beats on these machines:
Filebeat (filebeat-7.4.0-amd64.deb)
Metricbeat (metricbeat-7.4.0-amd64.deb)

These Beats allow us to collect the following information from each machine:
Metricbeats monitors a server by collecting metrics such as CPU and Memory usage then analyzing and outputting that information to a dashboard like Kibana
Filebeat monitors a servers files and logs systems, simply analyzes and monitors for issues the forwards that information in a very readable manner to a dashboard such as Kibana.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the beats playbook YAML file to ‘roles’ directory under your ‘Ansibles' directory.
- Update the beats configuration file (Kibana, Elasticsearch) to include IP address and Port of the VM to be monitored. (10.1.0.4:9200)
- Run the playbook, and navigate to servers ‘/etc’ directory to check that the installation worked as expected. In ‘/etc’ there should be a metricbeat and filebeat directories. Lastly, using the IP address of the ELK server, on your local host access Kibana using ‘http://13.89.218.128:5601/app/kibana’. (http://YOUR.IP.ADDRESS:5601/app/kibana)
- If all done correctly, Kibana will log/analyze file and metric data and output that information on this dash system.

Answer the following questions to fill in the blanks:
- The playbook is the file that specifies the modules and configurations to use in deployment. It can be named what you would like. Typically ends with “.yml” as a YAML file. It will be copied and ran from your designated playbook directory within the Ansible directory (etc/ansible/roles)
- The Ansible configuration file needs to be updated to specify which servers are “webservers” and which is the “ELK” server. Once that is properly designated within the Ansible config file, when creating the playbooks for filebeat and metricbeat a “hosts” must be designated at the top of the playbook. Here, either ELK or Webservers must be designated to determine where the playbook will be deployed.
- (http://YOUR.IP.ADDRESS:5601/app/kibana)  

	Example: ‘http://13.89.218.128:5601/app/kibana’

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

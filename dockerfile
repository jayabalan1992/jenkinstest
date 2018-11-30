FROM centos:7
RUN mkdir /root/packer
WORKDIR /root/packer
RUN yum install -y wget && yum install -y unzip
RUN wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
RUN unzip packer*.zip
RUN unzip terraform*.zip
RUN mv packer /usr/local/bin/packer
RUN mv terraform /usr/local/bin/terraform
RUN rm -rf *.zip

RUN mkdir /root/git
RUN yum install -y git


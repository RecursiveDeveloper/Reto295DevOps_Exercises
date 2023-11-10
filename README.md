# Reto295DevOps_Exercises
![image](https://www.emizentech.com/blog/wp-content/uploads/sites/2/2022/06/LAMP-Stack-.jpg)

Deploy a [LAMP](https://aws.amazon.com/what-is/lamp-stack/?nc1=h_ls) stack using [Vagrant](https://www.vagrantup.com/) as your virtual machine manager. [MySQL](https://www.mysql.com/) is replaced by [MariaDB](https://mariadb.org/)

## Requirements
![image](https://lidsol.org/post/vagrant/featured.png)
* [Vagrant installation](https://developer.hashicorp.com/vagrant/docs/installation)

## Usage

Use Vagrant to deploy a LAMP stack with just few commands. If you want to check and learn more about Vagrant functionalities take a look at [Vagrant Documentation](https://developer.hashicorp.com/vagrant/docs) and [Vagrant cheat sheet](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4)

1. Get inside this cloned repository
2. Get inside Vagrant folder, there you'll find a [Vagrantfile](https://developer.hashicorp.com/vagrant/docs/vagrantfile) file with all the configuration needed to create and provision an **Ubuntu virtual machine**
3. Execute this command to initialize and lift up the virtual machine.
```bash
vagrant up
```
4. To **SSH** into the virtual machine execute
```bash
vagrant ssh
```
5. When you're done and wish to destroy the virtual machine, execute and then confirm
```bash
vagrant destroy
```
6. If you want to deploy this project manually without using Vagrant, get into **Exercise1** folder and execute
```bash
sudo ./deploy_LAMP.sh
```
7. If you want to destroy this project manually without using Vagrant, get into **Exercise1** folder and execute
```bash
sudo ./destroy_LAMP.sh
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

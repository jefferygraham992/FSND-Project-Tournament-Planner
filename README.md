# Project: Tournament Planner

In this project, students will write a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

## Getting Started

These instructions will show you how to run the application locally.

### Prerequisites

* [Vagrant](https://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)
* [Python 2.7](https://www.python.org/downloads/release/python-2713/)

### Installing
1. Install [Virtual Box](https://www.virtualbox.org/)
  1. VirtualBox is the software that actually runs the virtual machine.
2. Install  [Vagrant](https://www.vagrantup.com/)
  1. Vagrant is the software that configures the VM and lets you share files between your host computer and the VM's filesystem.
3. Download the VM configuration:
  1. Clone the repo by running the following command from the command prompt
    1. `$ git clone https://github.com/jefferygraham992/FSND-Project-Tournament-Planner.git`
  2. Change to the  application directory
    1. `$ cd /FSND-Project-Tournament-Planner`
  3. Change directory to the vagrant directory inside (this directory contains the VM confidguration)
    1. `$ cd /vagrant`
4. Start the virtual machine:
  1. From your terminal, inside the vagrant subdirectory, run the command **vagrant up**. This will cause Vagrant to download the Linux operating system and install it.
    1. `$ vagrant up`
  2. When vagrant up is finished running, you can run **vagrant ssh** to log in to your newly installed Linux VM.
    1. `$ vagrant ssh`
  3. Change directory to /vagrant
    1. `$ cd /vagrant`
  4. Change directory to /vagrant
    1. `$ cd  /tournament`
5. Create the database, tables and views
  1. `$  psql -f tournament.sql`
6. Run the **tournament_test.py** file to test the functions written in **tournament.py**
  1. `$  python tournament_test.py`





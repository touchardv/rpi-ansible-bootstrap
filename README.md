rpi-ansible-bootstrap
=====================

An Ansible playbook for bootstrapping a freshly installed Raspberry Pi (Raspbian).

## Installation

You need the following software installed:

* Ansible (2.4.1+)

## Usage

### Prepare the SD card

* Format and write the Raspbian image to the SD card (Raspbian Jessie Lite 2017-07-05 used for testing).
* If you want to use Wifi for networking, edit `template/wpa_supplicant.conf` (ssid and psk).
* Prepare the OS initial boot, run the script: `prepare.sh path/to/mounted/image`. This will:
	* Enable SSH access.
	* Copy the `wpa_supplicant.conf` file.

### Bootstrap your Pi

* Boot your Raspberry Pi.
* Create your own variable template: `cp vars/global_variables.yml.example vars/global_variables.yml`
* Edit and customize the variables according to your home network, locale...
* Determine the IP address of your Pi.
* Run the Ansible bootstrap play: `./bootstrap.sh <current.dhcp.ip.address>`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/touchardv/rpi-ansible-bootstrap.

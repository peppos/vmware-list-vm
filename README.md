# vmware-list-vm
Print clusters,hosts and VMs for datacenter and filter the VMs as type Linux.

# Require
Require VMware-vSphere-CLI

# CLI version
Using VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz

# Usage

 perl .pl --server <vsphere_host> --username <username> --password <password> --datacenter <datacenter_name>

# Command options


Synopsis: .pl OPTIONS


Command-specific options:
   --datacenter (required)
      Datacenter name

Common VI options:
   --config (variable VI_CONFIG)
      Location of the VI Perl configuration file
   --credstore (variable VI_CREDSTORE)
      Name of the credential store file defaults to <HOME>/.vmware/credstore/vicredentials.xml on Linux and <APPDATA>/VMware/credstore/vicredentials.xml on Windows
   --encoding (variable VI_ENCODING, default 'utf8')
      Encoding: utf8, cp936 (Simplified Chinese), iso-8859-1 (German), shiftjis (Japanese)
   --help
      Display usage information for the script
   --passthroughauth (variable VI_PASSTHROUGHAUTH)
      Attempt to use pass-through authentication
   --passthroughauthpackage (variable VI_PASSTHROUGHAUTHPACKAGE, default 'Negotiate')
      Pass-through authentication negotiation package
   --password (variable VI_PASSWORD)
      Password
   --portnumber (variable VI_PORTNUMBER)
      Port used to connect to server
   --protocol (variable VI_PROTOCOL, default 'https')
      Protocol used to connect to server
   --savesessionfile (variable VI_SAVESESSIONFILE)
      File to save session ID/cookie to utilize
   --server (variable VI_SERVER, default 'localhost')
      VI server to connect to. Required if url is not present
   --servicepath (variable VI_SERVICEPATH, default '/sdk/webService')
      Service path used to connect to server
   --sessionfile (variable VI_SESSIONFILE)
      File containing session ID/cookie to utilize
   --url (variable VI_URL)
      VI SDK URL to connect to. Required if server is not present
   --username (variable VI_USERNAME)
      Username
   --verbose (variable VI_VERBOSE)
      Display additional debugging information
   --version
      Display version information for the script

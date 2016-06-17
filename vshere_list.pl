#!/usr/bin/perl -w

use strict;
use warnings;

use VMware::VIRuntime;

$Util::script_version = "1.0";

my %opts = (
   datacenter => {
      type => "=s",
      help => "Datacenter name",
      required => 1,
   },
);

# read/validate options and connect to the server
Opts::add_options(%opts);
Opts::parse();
Opts::validate();
Util::connect();

# find datacenter
my $datacenter = Opts::get_option('datacenter');
my $datacenter_view = Vim::find_entity_view(view_type => 'Datacenter',
                                            filter => { name => $datacenter });

if (!$datacenter_view) {
   die "Datacenter '" . $datacenter . "' not found\n";
}

# get all cluster under this datacenter
my $cluster_views = Vim::find_entity_views(view_type => 'ClusterComputeResource',
                                        begin_entity => $datacenter_view );

# get all hosts and VM under this datacenter
foreach my $cluster_view (@$cluster_views) {
        my $host_views = Vim::find_entity_views(view_type => 'HostSystem',
                                                begin_entity => $cluster_view );
        my $vm_views = Vim::find_entity_views(view_type => 'VirtualMachine',
                                                begin_entity => $cluster_view );
# print cluster
my $cluster_name = $cluster_view->name;
Util::trace(0, "Cluster Name: $cluster_name \n");

# print hosts
my $count_host = 1;
print "  Hosts found:\n";
foreach my $host_view (@$host_views) {
   print "   $count_host: " . $host_view->name . "\n";
   $count_host++;
}

# print vm for this cluster
if($cluster_view) {
     my $vm_list = Vim::find_entity_views(  view_type => 'VirtualMachine',
                                                                 begin_entity => $cluster_view,
                                                                 filter => { 'config.guestFullName' => qr/Linux/ },
                                                                 properties => [ 'name' ] );

print "  VM found:\n";
my $count_vm = 1;
     foreach my $vm_ref(@$vm_list) {
          print "   $count_vm: " . $vm_ref->name."\n";
        $count_vm++;
     }
print "####################\n";
}

}

# disconnect from the server
Util::disconnect();

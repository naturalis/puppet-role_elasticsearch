# == Class: role_elasticsearch
#
#
class role_elasticsearch(
  $node.name    = $::hostname,
  $cluster.name = 'cluster-01',
  $network.host = '127.0.0.1', #$::ipaddress
  $replicas     = '0',
  $shards       = '1',
  $es_version   = '1.1.1',
){

  class { 'elasticsearch':
    package_url           => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${es_version}.deb",
    java_install          => true,
    
    # Default settings
    config                => {
      'cluster'           => {
        'name'            => $cluster.name,
       },
       'node'                 => {
         'name'               => $node.name
       },
       'index'                => {
         'number_of_replicas' => $replicas,
         'number_of_shards'   => $shards
       },
       'network'              => {
         'host'               => $network.host
       }
     } 
   }
   
  # Create instance
  elasticsearch::instance { 'instance-01':
    #config => { 'node.name' => 'othernodename' }
  }

  # Install kopf plugin
  elasticsearch::plugin { 'lmenezes/elasticsearch-kopf':
    module_dir => 'kopf',
    instances  => 'instance-01'
  }
  
  # Install kibana plugin
  elasticsearch::plugin { 'elasticsearch/kibana':
    module_dir => 'kibana',
    url        => 'http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip',
    instances  => 'instance-01'
  }

}

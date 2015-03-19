# == Class: role_elasticsearch
#
#
class role_elasticsearch(
  $nodename    = $::hostname,
  $clustername = 'cluster-03',
  $networkhost = $::ipaddress,
  $replicas    = '0',
  $shards      = '1',
  $es_version  = '1.1.1',
){

  class { 'elasticsearch':
    package_url           => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${es_version}.deb",
    #java_install          => true,
    
    # Default settings
    config                => {
      'cluster'           => {
        'name'            => $clustername,
       },
       'node'                 => {
         'name'               => $nodename
       },
       'index'                => {
         'number_of_replicas' => $replicas,
         'number_of_shards'   => $shards
       },
       'network'              => {
         'host'               => $networkhost
       }
     } 
   }
   
  # Create instance
  elasticsearch::instance { 'es-01':
    #config => { 'node.name' => 'othernodename' }
  }

  # Install kopf plugin
  elasticsearch::plugin { 'lmenezes/elasticsearch-kopf':
    module_dir => 'kopf',
    instances  => 'es-01'
  }
  
  # Install kibana plugin
  elasticsearch::plugin { 'elasticsearch/kibana':
    module_dir => 'kibana',
    url        => 'http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip',
    instances  => 'es-01'
  }

}

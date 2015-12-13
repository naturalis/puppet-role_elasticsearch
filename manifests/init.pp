# == Class: role_elasticsearch
#
#
class role_elasticsearch (
  $package_url = 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.deb',
  $nodename    = $::hostname,
  $clustername = 'cluster-01',
  $networkhost = $::ipaddress,
  $replicas    = '0',
  $shards      = '1',
) {

  class { 'elasticsearch':
    package_url  => $package_url,
    java_install => true,
    
    # Default settings
    config                    => {
      'cluster'               => {
        'name'                => $clustername,
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
  }

  # Install kopf plugin
  elasticsearch::plugin { 'lmenezes/elasticsearch-kopf':
    instances  => 'es-01'
  }

}

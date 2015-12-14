# == Class: role_elasticsearch
#
#
class role_elasticsearch (
  $package_url = 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.deb',
  $clustername = 'cluster-01',
  $replicas    = '0',
  $shards      = '1',
) {

  class { 'elasticsearch':
    package_url  => $package_url,
    java_install => true,
    config                    => {
      'cluster'               => {
        'name'                => $clustername,
       },
      'index'                 => {
         'number_of_replicas' => $replicas,
         'number_of_shards'   => $shards
       },
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

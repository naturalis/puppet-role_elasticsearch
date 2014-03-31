# == Class: role_elasticsearch
#
#
class role_elasticsearch(
  $nodename,
  $clustername        = 'clustername',
  $replicas           = '0',
  $shards             = '5',
  $es_version         = '1.1.0',
){

  class { 'elasticsearch':
    package_url           => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${es_version}.deb",
    java_install          => true,
    config                => {
      'cluster'           => {
       'name'             => $clustername,
       },
       'node'                 => {
         'name'               => $nodename
       },
       'index'                => {
         'number_of_replicas' => $replicas,
         'number_of_shards'   => $shards
       },
       'network'              => {
         'host'               => $::ipaddress
       }
     }
   
  }
}
# == Class: role_elasticsearch
#
#
class role_elasticsearch(
  $nodename    = $::hostname,
  $clustername = $::hostname,
  $replicas    = '0',
  $shards      = '1',
  $es_version  = '1.1.1',
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

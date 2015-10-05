class esb_integration_cluster_node {
   include '::roles::esb_integration_cluster_node'
   
   notify { "::roles::esb_integration_cluster_node": }
}

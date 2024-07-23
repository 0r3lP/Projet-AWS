# Module pour la configuration réseau 
module "network" {
  source = "../Modules/network"
}

# Module pour le groupe de sécurité
module "security_group" {
  source = "../Modules/security-group"
}

# Module pour le cluster ECS
module "ecs_cluster" {
  source = "../Modules/ecs-cluster"
  subnet_ids = module.network.subnet_ids
}

# Module pour le volume EBS
module "volume_ebs" {
  source = "../Modules/volume-ebs"
}

# Module pour le service ECS
module "ecs_service" {
  source = "../Modules/ecs-service"
  cluster_id    = module.ecs_cluster.cluster_id
  security_group_id = module.security_group.id
  subnet_ids    = module.network.subnet_ids
  ebs_volume_id = module.volume_ebs.id
}


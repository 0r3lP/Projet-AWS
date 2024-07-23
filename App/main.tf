# Permet d'obtenir les zones de disponibilités disponibles
data "aws_availability_zones" "available" {}

# Module pour la configuration réseau 
module "network" {
  source = "../Modules/network"
}

# Module pour le groupe de sécurité
module "security_group" {
  source = "../Modules/security-group"
  vpc_id = module.network.vpc_id
}

# Module pour le cluster ECS
module "ecs_cluster" {
  source = "../Modules/ecs-cluster"
}

# Module pour l'instance ECS
module "ecs_instance" {
  source = "../Modules/ecs-instance"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_ids    = module.network.subnet_ids
  vpc_id        = module.network.vpc_id
}

# Module pour le volume EBS
module "volume_ebs" {
  source = "../Modules/volume-ebs"
  availability_zone = data.aws_availability_zones.available.names[0] 
  instance_id = module.ecs_instance.instance_id
}

# Module pour le service ECS
module "ecs_service" {
  source = "../Modules/ecs-service"
  cluster_id          = module.ecs_cluster.cluster_id
  security_group_id   = module.security_group.security_group_id
  subnet_ids          = module.network.subnet_ids
}

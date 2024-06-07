locals {
  common_tags = {
    Environment   = "LAB"
    Creator       = "Hernán De León" 
    SolutionName  = "shared"
    Temporary     = "false"
    Scope         = "networking"
    CreatorOnDate = timestamp()
  }
}
// will it work? lets give another try

// first, lets run terraform init again, because this command is not only used to download providers, but to create the modules as well.
// this time, we use an aditional parameter: -upgrade to force terraform to download the modules to the .terraform folder as well.
terraform init -upgrade

// show the .terraform folder again

// and then, lets plan the changes
terraform plan

// looks good. Time to another commit, right?
// will it work? lets give another try

// first, lets run terraform init again, because this command is not only used to download providers, but to create the modules as well.
// this time, we use an aditional parameter: -upgrade
terraform init -upgrade


// and then, lets plan the changes
terraform plan

// looks good. Time to another commit, right?
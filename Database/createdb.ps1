# Install the Cosmos DB Powershell Module onto our machine
Install-Module -Name CosmosDB

# Create a new Cosmos DB Context
$cosmosDbContext = New-CosmosDbContext -Account $env:ACCOUNTNAME -Key $env:PRIMARY_KEY

# Create a new Database in our account using our Cosmos DB Context
New-CosmosDbDatabase -Context $cosmosDbContext -Id $env:DATABASENAME

# Create a new collection in our database
New-CosmosDbCollection -Context $cosmosDbContext -Id "Product" -Partition-Key = "ProductType" -OfferThroughput 400
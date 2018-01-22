# Build mod
.zip the folder of the project

# Install mod
Copy .zip `C:\Users\[user]\AppData\Roaming\Factorio\mods`

# Extract recipes & crafting machines to json
* Start game
* Load world
* Execute command: `/c remote.call("Extractor", "export_all");`

# Extract marathon/expensive recipes
In order to extract expensive recipes just extract the recipes as usual but in marathon world.

Location of extracted data: `C:\Users\[user]\AppData\Roaming\Factorio\script-output`

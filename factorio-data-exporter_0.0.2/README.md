# Factorio-data-exporter

## Build mod

.zip the folder

## Install mod

Copy .zip `C:\Users\[user]\AppData\Roaming\Factorio\mods`

## Extract recipes & crafting machines & modules to json

* Start game
* Load world
* Execute command: `/c remote.call("Extractor", "export_all");`

Location of extracted data: `C:\Users\[user]\AppData\Roaming\Factorio\script-output`

## Extract marathon/expensive recipes

In order to extract expensive recipes just extract the recipes as usual but in marathon world.

## Extract mod recipes

In order to extract expensive recipes just extract the recipes as usual but in worl with mods enabled.
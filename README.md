
# *Simple godot tileset generator*

### -- *Credits*
> *Exmaple Tileset https://v3x3d.itch.io/bountiful-bits - VEXED

## What does it do?
generates single tile tileset from an image with fixed tile sizes
works bests on tilesets with few gaps

## **Setup**

```
 - Open the godot project change the TILESET.png to your tileset
 - Set Change setup variables on Node2D from the inspector panel
 -- name
 -- width (in tiles)
 -- height (in tiles)
 -- tile size
 -- select your base image
```

```
You'll find the exported tileset in your user:// dir
```
| OS | PATH |
| ------ | ------ |
| **Windows:** | %APPDATA%\Godot\
| **macOS:** | ~/Library/Application Support/Godot/
| **Linux:** | ~/.local/share/godot/


[GODOT DOCS][PlGd]


if you want you can use the tilemap node in the project to test you're new tileset or simply drag and drop it into your own project


-

   [PlGd]: <https://docs.godotengine.org/en/3.4/tutorials/io/data_paths.html>

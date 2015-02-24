# Spoopy FPS
This git is for the second project of the level design class, the SPOOPY FPS! Read this file thoroughly. For any help or whatever, you can contact me quickly by email: [gulliverjko@gmail.com](gulliverjko@gmail.com)

**I strongly suggest you get to know the project and become familiar with it, don't just assume that you have one task and that's all you have to care about. This is an indie project, everyone is involved, any problem is also yours.**

##Where stuff is
- [Github repo](https://github.com/JokieW/SpoopyFPS)
- [Trello board](https://trello.com/b/8RZgyquD/spoopy-fps)
- [Google Drive docs](www.google.com) (todo)

## Structure of the project
* **Scenes** - All the game's scenes. **WARNING** : Do not modify scenes which you do not explicitly have the authorization for. Scene merge conflicts in git are not cool and will make *someone* potentially lose a lot of work. If you didn't make a scene and you want to edit it, find the owner and ask if it's okay first. **ALWAYS SAY NO** to unity when it asks you if you want to save something you did not *explicitly* modify.
 * **Privates** - Private scenes for you to use only. You can do whatever you want in the scene with your name. Use these to test things and show them off before implementing them in a real scene. 
* **Resources** - Contains the binary files, like textures, audio and models
 * **Audio** - Any sound or BGMs
 * **Materials** - Any loose material not tied to a model
 * **Models** - Any models, this should contain one folder per object with everything tied to it in it (Mesh, materials, etc.)
 * **Prefabs** - Any prefabs
 * **Textures** - Any loose texture not tied to a model
* **src** - All the source code. I call it src because it sounds cool and it looks cool and I can do whatever I want.
* **UnityVS** - Don't touch this, it's the unityVS files, for those who uses Visual Studio 2013 instead of CrappyDevelop (You should)

## Misc
- Always move or delete .meta files when you move or delete a file. Folders has .meta too.

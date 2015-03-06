#pragma strict
 
// Take effect even in edit mode
@script ExecuteInEditMode()
 
// Get a reference to the player
public var player : Transform;
  
function Update ()
{
    if (player != null) {
        // Pass the player location to the shader
        GetComponent.<Renderer>().sharedMaterial.SetVector("_PlayerPosition", player.position);
    }
}
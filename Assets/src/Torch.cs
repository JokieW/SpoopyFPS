using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public Color color = new Color(0, 0, 0);
	private Color nextColor = new Color(0, 0, 0);

	bool shrinking = false;
	bool expanding = false;

	// Use this for initialization
	void Start ()
	{
		color = Color.red;
		gameObject.renderer.material.color = color;
	}

	void Update ()
	{
		if (shrinking) {
			Shrink();
		} else if (expanding) {
			Expand();
		} else {

			if(Input.GetKeyDown(KeyCode.Alpha1) && color != Color.red)
			{
				shrinking = true;
				nextColor = Color.red;
				//gameObject.light.color = Color.red;
			}
			if(Input.GetKeyDown(KeyCode.Alpha2) && color != Color.blue)
			{
				shrinking = true;
				nextColor = Color.blue;
				//gameObject.light.color = Color.blue;
			}
			if(Input.GetKeyDown(KeyCode.Alpha3) && color != Color.green)
			{
				shrinking = true;
				nextColor = Color.green;
				//gameObject.light.color = Color.green;
			}

		}
	}

	void Shrink()
	{
		if (transform.localScale.x >= 0) {
			transform.localScale += new Vector3 (-1.0F, -1.0F, -1.0F);
			light.range -= 1;
		} else {
			color = nextColor;
			gameObject.renderer.material.color = nextColor;
			gameObject.light.color = nextColor;
			shrinking = false;
			expanding = true;
		}
	}

	void Expand()
	{
		if (transform.localScale.x < 30) {
			transform.localScale += new Vector3 (+1.0F, +1.0F, +1.0F);
			light.range += 1;
		} else {
			expanding = false;
		}
	}
}

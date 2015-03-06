using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public Color color = new Color(0, 0, 0);
	private Color nextColor = new Color(0, 0, 0);

	private int colorIndex = 0;

	bool shrinking = false;
	bool expanding = false;

	// Use this for initialization
	void Start ()
	{
		color = Color.red;
		gameObject.GetComponent<Renderer>().material.color = color;
	}

	void Update ()
	{
		gameObject.GetComponent<Renderer>().sharedMaterial.SetInt("_TorchColor", colorIndex);

		if (shrinking) {
			Shrink();
		} else if (expanding) {
			Expand();
		} else {

			if(Input.GetKeyDown(KeyCode.Alpha1) && color != Color.red)
			{
				shrinking = true;
				nextColor = Color.red;
				colorIndex = 0;
				//gameObject.light.color = Color.red;
			}
			if(Input.GetKeyDown(KeyCode.Alpha2) && color != Color.blue)
			{
				shrinking = true;
				nextColor = Color.blue;
				colorIndex = 1;
				//gameObject.light.color = Color.blue;
			}
			if(Input.GetKeyDown(KeyCode.Alpha3) && color != Color.green)
			{
				shrinking = true;
				nextColor = Color.green;
				colorIndex = 2;
				//gameObject.light.color = Color.green;
			}

		}
	}

	void Shrink()
	{
		if (transform.localScale.x >= 0) {
			transform.localScale += new Vector3 (-1.0F, -1.0F, -1.0F);
			GetComponent<Light>().range -= 1;
		} else {
			color = nextColor;
			gameObject.GetComponent<Renderer>().material.color = nextColor;
			gameObject.GetComponent<Light>().color = nextColor;
			shrinking = false;
			expanding = true;
		}
	}

	void Expand()
	{
		if (transform.localScale.x < 30) {
			transform.localScale += new Vector3 (+1.0F, +1.0F, +1.0F);
			GetComponent<Light>().range += 1;
		} else {
			expanding = false;
		}
	}
}

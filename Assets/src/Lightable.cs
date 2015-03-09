using UnityEngine;
using System.Collections;

public class Lightable : MonoBehaviour {

	public bool red = false;
	public bool blue = false;
	public bool green = false;

	// Use this for initialization
	void Start () {
	}

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Torch")
		{
			Torch torch = collider.gameObject.GetComponent("Torch") as Torch;
			if(torch.color == Color.red && red)
			{
				Illuminate(true);
			}
			if(torch.color == Color.blue && blue)
			{
				Illuminate(true);
			}
			if(torch.color == Color.green && green)
			{
				Illuminate(true);
			}
		}
	}

	void OnTriggerExit(Collider collider)
	{
		if (collider.gameObject.tag == "Torch")
		{
			Illuminate(false);
		}
	}

	void Illuminate(bool light)
	{
		if (light) {
			GetComponent<Collider>().isTrigger = false;
            GetComponent<Renderer>().enabled = true;
		} else {
			GetComponent<Collider>().isTrigger = true;
            GetComponent<Renderer>().enabled = false;
		}
	}
}

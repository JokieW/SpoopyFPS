using UnityEngine;
using System.Collections;

public class Lightable : MonoBehaviour {

	public bool red = false;
	public bool blue = false;
	public bool green = false;

	private Torch torch;

	private TorchesManager torches;

	void Start()
	{
		torches = GameObject.FindGameObjectWithTag ("TorchesManager").GetComponent<TorchesManager>() as TorchesManager;
		if (red) {
			torch = torches.getRedTorch();
		} else if (blue) {
			torch = torches.getBlueTorch();
		} else if (green) {
			torch = torches.getGreenTorch();
		}
		//Debug.Log (torches);
	}

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Torch")
		{
			Torch collidedTorch = collider.gameObject.GetComponent("Torch") as Torch;
			if(collidedTorch == torch)
			{
				Illuminate(true);
			}
		}
	}

	void OnTriggerExit(Collider collider)
	{
		Torch collidedTorch = collider.gameObject.GetComponent("Torch") as Torch;
		if(collidedTorch == torch)
		{
			Illuminate(false);
		}
	}
	
	// Update is called once per frame
	void Update () {
		if (torch != null) {
			// Pass the player location to the shader
			GetComponent<Renderer>().sharedMaterial.SetVector("_PlayerPosition", torch.transform.position);
			GetComponent<Renderer>().sharedMaterial.SetFloat("_VisibleDistance", (torch.transform.localScale.x / 2));
		}
	}

	void Illuminate(bool light)
	{
		if (light) {
			GetComponent<Collider>().isTrigger = false;
            //GetComponent<Renderer>().enabled = true;
		} else {
			GetComponent<Collider>().isTrigger = true;
            //GetComponent<Renderer>().enabled = false;
		}
	}
}

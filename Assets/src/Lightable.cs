using UnityEngine;
using System.Collections;

public class Lightable : MonoBehaviour {

	public bool red = false;
	public bool blue = false;
	public bool green = false;

	public Material litRed;
	public Material unlitRed;

	public Material litBlue;
	public Material unlitBlue;

	public Material litGreen;
	public Material unlitGreen;

	// Use this for initialization
	void Start () {
		if(red){
			gameObject.renderer.material = unlitRed;
		} else if (blue) {
			gameObject.renderer.material = unlitBlue;
		} else {
			gameObject.renderer.material = unlitGreen;
		}
	}

	void OnTriggerEnter(Collider collider) {
		//Debug.Log ("collision");
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
			if(red){
				gameObject.renderer.material = litRed;
			} else if (blue) {
				gameObject.renderer.material = litBlue;
			} else {
				gameObject.renderer.material = litGreen;
			}

			collider.isTrigger = false;
		} else {
			if(red){
				gameObject.renderer.material = unlitRed;
			} else if (blue) {
				gameObject.renderer.material = unlitBlue;
			} else {
				gameObject.renderer.material = unlitGreen;
			}
			collider.isTrigger = true;
		}
	}
}
